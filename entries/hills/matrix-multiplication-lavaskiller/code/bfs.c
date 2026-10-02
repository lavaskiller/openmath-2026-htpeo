// Exhaustive breadth-first search of the flip graph component of a rank-23 <3,3,3> scheme,
// restricted to states with support <= seed_support + delta and |coef| <= maxc.
// Any state with support below the seed's is Brent-verified and written out.
// usage: bfs seed.txt prefix delta maxstates maxcoef
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#define RK 23
#define SZ (RK*27)
typedef signed char i8;
static int cmp27(const void*a,const void*b){ return memcmp(a,b,27); }
static void canon(i8*s){
  for(int t=0;t<RK;t++){ i8*x=s+27*t; int sg=1;
    for(int g=0;g<2;g++){ int f=0; for(int c=0;c<9;c++) if(x[9*g+c]){ f=x[9*g+c]; break; }
      if(f<0){ for(int c=0;c<9;c++) x[9*g+c]=-x[9*g+c]; sg=-sg; } }
    if(sg<0) for(int c=0;c<9;c++) x[18+c]=-x[18+c]; }
  qsort(s,RK,27,cmp27); }
static uint64_t hash(const i8*s){ uint64_t h=1469598103934665603ULL; for(int i=0;i<SZ;i++){ h^=(uint8_t)s[i]; h*=1099511628211ULL; } h^=h>>29; return h?h:1; }
static int support(const i8*s){ int n=0; for(int i=0;i<SZ;i++) n+=s[i]!=0; return n; }
static int par(const i8*x,const i8*y){ int p=1,m=1; for(int i=0;i<9;i++){ if(x[i]!=y[i])p=0; if(x[i]!=-y[i])m=0; if(!p&&!m)return 0; } return p?1:-1; }
static int brent(const i8*s){
  for(int a=0;a<9;a++)for(int b=0;b<9;b++)for(int c=0;c<9;c++){ long sum=0; for(int t=0;t<RK;t++) sum+=(long)s[27*t+a]*s[27*t+9+b]*s[27*t+18+c];
    int i=a/3,j=a%3,j2=b/3,k=b%3; if(sum!=((j==j2&&c==3*k+i)?1:0)) return 0; } return 1; }
static uint64_t *tab; static uint64_t tmask;
static int insert(uint64_t h){ uint64_t i=h&tmask; while(tab[i]){ if(tab[i]==h) return 0; i=(i+1)&tmask; } tab[i]=h; return 1; }
int main(int argc,char**argv){
  if(argc<6) return 0; FILE*f=fopen(argv[1],"r"); if(!f) return 0; int R,sup0; if(fscanf(f,"%d %d",&R,&sup0)!=2||R!=RK) return 0;
  long maxst=atol(argv[4]); int delta=atoi(argv[3]), maxc=atoi(argv[5]);
  i8*Q=malloc((size_t)maxst*SZ); if(!Q){ fprintf(stderr,"nomem\n"); return 0; }
  for(int i=0;i<SZ;i++){ int x; if(fscanf(f,"%d",&x)!=1) return 0; Q[i]=(i8)x; } fclose(f);
  uint64_t tsz=1; while(tsz<(uint64_t)maxst*2) tsz<<=1; tab=calloc(tsz,8); tmask=tsz-1;
  canon(Q); int s0=support(Q); int lim=s0+delta; insert(hash(Q)); long head=0,tail=1; long hist[64]={0}; int best=s0; long zero=0;
  fprintf(stderr,"seed support %d limit %d brent %d\n",s0,lim,brent(Q));
  i8 cur[SZ],nb[SZ];
  while(head<tail){
    memcpy(cur,Q+(size_t)head*SZ,SZ); head++;
    if((head&0xFFFFF)==0){ fprintf(stderr,"expanded %ld queued %ld best %d\n",head,tail,best); fflush(stderr); }
    for(int g=0;g<3;g++)for(int i=0;i<RK;i++)for(int j=0;j<RK;j++){ if(i==j) continue; int s=par(cur+27*i+9*g,cur+27*j+9*g); if(!s) continue;
      for(int role=0;role<2;role++)for(int lam=-1;lam<=1;lam+=2){
        int g1=(g+1+role)%3,g2=(g+2-role)%3;
        memcpy(nb,cur,SZ); int ok=1,z1=1,z2=1;
        for(int c=0;c<9;c++){ int y=nb[27*i+9*g1+c]+lam*s*cur[27*j+9*g1+c]; int z=nb[27*j+9*g2+c]-lam*cur[27*i+9*g2+c];
          if(y>maxc||y<-maxc||z>maxc||z<-maxc){ ok=0; break; } nb[27*i+9*g1+c]=(i8)y; nb[27*j+9*g2+c]=(i8)z; if(y)z1=0; if(z)z2=0; }
        if(!ok) continue; if(z1||z2){ zero++; if(zero<5){ char fn[256]; snprintf(fn,sizeof fn,"%s_ZERO_%ld.txt",argv[2],zero); FILE*o=fopen(fn,"w"); if(o){ fprintf(o,"%d 0\n",RK); for(int t=0;t<RK;t++){ for(int c=0;c<27;c++) fprintf(o,"%d ",nb[27*t+c]); fprintf(o,"\n"); } fclose(o);} } continue; }
        int sp=support(nb); if(sp>lim) continue;
        canon(nb); if(!insert(hash(nb))) continue;
        if(sp-s0+32>=0 && sp-s0+32<64) hist[sp-s0+32]++;
        if(sp<best){ best=sp; int bo=brent(nb); fprintf(stderr,"NEW BEST %d brent %d at expanded %ld\n",sp,bo,head); fflush(stderr);
          char fn[256]; snprintf(fn,sizeof fn,"%s_best_%d.txt",argv[2],sp); FILE*o=fopen(fn,"w"); if(o){ fprintf(o,"%d %d\n",RK,sp); for(int t=0;t<RK;t++){ for(int c=0;c<27;c++) fprintf(o,"%d ",nb[27*t+c]); fprintf(o,"\n"); } fclose(o);} }
        if(tail<maxst){ memcpy(Q+(size_t)tail*SZ,nb,SZ); tail++; }
        else { fprintf(stderr,"state cap reached (expanded %ld)\n",head); goto done; }
      } }
  }
done:
  { char fn[256]; snprintf(fn,sizeof fn,"%s_states.bin",argv[2]); FILE*o=fopen(fn,"wb"); if(o){ fwrite(Q,SZ,(size_t)tail,o); fclose(o); } }
  fprintf(stderr,"finished: expanded %ld states %ld best %d zeros %ld complete %d\n",head,tail,best,zero,head>=tail);
  for(int k=0;k<64;k++) if(hist[k]) fprintf(stderr,"support %d: %ld\n",s0+k-32,hist[k]);
  return 0; }
