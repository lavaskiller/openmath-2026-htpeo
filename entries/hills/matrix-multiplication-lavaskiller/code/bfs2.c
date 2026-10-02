// Exhaustive BFS in the flip graph of <3,3,3> schemes with one level of "plus" (split) transitions:
// rank-23 states (support <= s0+d23) -- flips, splits into rank 24;
// rank-24 states (support <= s0+d24) -- flips, reductions (merge of two terms sharing two factors,
// vanishing terms) back to rank 23. Every rank-23 state with support below the seed's is
// Brent-verified (exact integers) and written out; so is any state of rank < 23.
// usage: bfs2 seed.txt prefix d23 d24 maxstates maxcoef dplus
//   dplus: only rank-23 states with support <= s0+dplus are split.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#define RMAX 24
#define SZ (RMAX*27+1)
typedef signed char i8;
static int cmp27(const void*a,const void*b){ return memcmp(a,b,27); }
static void canon(i8*s,int r){
  for(int t=0;t<r;t++){ i8*x=s+27*t; int sg=1;
    for(int g=0;g<2;g++){ int f=0; for(int c=0;c<9;c++) if(x[9*g+c]){ f=x[9*g+c]; break; }
      if(f<0){ for(int c=0;c<9;c++) x[9*g+c]=-x[9*g+c]; sg=-sg; } }
    if(sg<0) for(int c=0;c<9;c++) x[18+c]=-x[18+c]; }
  qsort(s,r,27,cmp27); memset(s+27*r,0,27*(RMAX-r)); s[RMAX*27]=(i8)r; }
static uint64_t hash(const i8*s){ uint64_t h=1469598103934665603ULL; for(int i=0;i<SZ;i++){ h^=(uint8_t)s[i]; h*=1099511628211ULL; } h^=h>>29; return h?h:1; }
static int support(const i8*s,int r){ int n=0; for(int i=0;i<27*r;i++) n+=s[i]!=0; return n; }
static int par(const i8*x,const i8*y){ int p=1,m=1; for(int i=0;i<9;i++){ if(x[i]!=y[i])p=0; if(x[i]!=-y[i])m=0; if(!p&&!m)return 0; } return p?1:-1; }
static int zero9(const i8*x){ for(int i=0;i<9;i++) if(x[i]) return 0; return 1; }
static int brent(const i8*s,int r){
  for(int a=0;a<9;a++)for(int b=0;b<9;b++)for(int c=0;c<9;c++){ long sum=0; for(int t=0;t<r;t++) sum+=(long)s[27*t+a]*s[27*t+9+b]*s[27*t+18+c];
    int i=a/3,j=a%3,j2=b/3,k=b%3; if(sum!=((j==j2&&c==3*k+i)?1:0)) return 0; } return 1; }
static uint64_t *tab; static uint64_t tmask;
static int insert(uint64_t h){ uint64_t i=h&tmask; while(tab[i]){ if(tab[i]==h) return 0; i=(i+1)&tmask; } tab[i]=h; return 1; }
static i8*Q; static long head=0,tail=0,maxst; static int s0,lim23,lim24,best,capped=0; static const char*prefix; static long nred=0,n23=0,n24=0;
static void writest(const char*tag,const i8*s,int r,int sp){ char fn[300]; snprintf(fn,sizeof fn,"%s_%s_r%d_s%d.txt",prefix,tag,r,sp); FILE*o=fopen(fn,"w"); if(!o) return;
  fprintf(o,"%d %d\n",r,sp); for(int t=0;t<r;t++){ for(int c=0;c<27;c++) fprintf(o,"%d ",s[27*t+c]); fprintf(o,"\n"); } fclose(o); }
// remove zero terms; returns new rank
static int dropzero(i8*s,int r){ for(int t=0;t<r;){ if(zero9(s+27*t)||zero9(s+27*t+9)||zero9(s+27*t+18)){ memmove(s+27*t,s+27*(r-1),27); r--; } else t++; } return r; }
static void push(i8*nb,int r){
  r=dropzero(nb,r);
  int sp=support(nb,r);
  if(r>=24){ if(sp>lim24) return; } else if(r==23){ if(sp>lim23) return; }
  canon(nb,r); if(!insert(hash(nb))) return;
  if(r<23){ int bo=brent(nb,r); fprintf(stderr,"RANK %d state support %d brent %d\n",r,sp,bo); if(bo) writest("RANK",nb,r,sp); return; }
  if(r==23){ n23++; if(sp<best){ int bo=brent(nb,r); fprintf(stderr,"NEW BEST %d brent %d (expanded %ld)\n",sp,bo,head); fflush(stderr); if(bo){ best=sp; writest("best",nb,r,sp); } } }
  else n24++;
  if(tail<maxst){ memcpy(Q+(size_t)tail*SZ,nb,SZ); tail++; } else capped=1; }
int main(int argc,char**argv){
  if(argc<8) return 0; FILE*f=fopen(argv[1],"r"); if(!f) return 0; int R,sup0; if(fscanf(f,"%d %d",&R,&sup0)!=2||R!=23) return 0;
  prefix=argv[2]; int d23=atoi(argv[3]),d24=atoi(argv[4]); maxst=atol(argv[5]); int maxc=atoi(argv[6]); int dplus=atoi(argv[7]);
  Q=malloc((size_t)maxst*SZ); if(!Q){ fprintf(stderr,"nomem\n"); return 0; }
  i8 cur[SZ],nb[SZ]; memset(cur,0,SZ);
  for(int i=0;i<23*27;i++){ int x; if(fscanf(f,"%d",&x)!=1) return 0; cur[i]=(i8)x; } fclose(f);
  uint64_t tsz=1; while(tsz<(uint64_t)maxst*2) tsz<<=1; tab=calloc(tsz,8); tmask=tsz-1;
  s0=support(cur,23); lim23=s0+d23; lim24=s0+d24; best=s0;
  fprintf(stderr,"seed support %d brent %d lim23 %d lim24 %d\n",s0,brent(cur,23),lim23,lim24);
  canon(cur,23); insert(hash(cur)); memcpy(Q,cur,SZ); tail=1;
  while(head<tail){
    memcpy(cur,Q+(size_t)head*SZ,SZ); head++; int r=cur[RMAX*27];
    if((head&0x7FFFF)==0){ fprintf(stderr,"expanded %ld queued %ld (r23 %ld r24 %ld) best %d capped %d\n",head,tail,n23,n24,best,capped); fflush(stderr); }
    // reductions: merge pairs sharing two factors
    if(r==24) for(int i=0;i<r;i++)for(int j=i+1;j<r;j++){
      int p0=par(cur+27*i,cur+27*j),p1=par(cur+27*i+9,cur+27*j+9),p2=par(cur+27*i+18,cur+27*j+18); int h=-1,sg=0;
      if(p0&&p1){h=2;sg=p0*p1;} else if(p0&&p2){h=1;sg=p0*p2;} else if(p1&&p2){h=0;sg=p1*p2;}
      if(h<0) continue; memcpy(nb,cur,SZ); int ok=1;
      for(int c=0;c<9;c++){ int y=nb[27*i+9*h+c]+sg*cur[27*j+9*h+c]; if(y>maxc||y<-maxc){ ok=0; break; } nb[27*i+9*h+c]=(i8)y; }
      if(!ok) continue; memmove(nb+27*j,nb+27*(r-1),27); nred++; push(nb,r-1); }
    // flips
    for(int g=0;g<3;g++)for(int i=0;i<r;i++)for(int j=0;j<r;j++){ if(i==j) continue; int s=par(cur+27*i+9*g,cur+27*j+9*g); if(!s) continue;
      for(int role=0;role<2;role++)for(int lam=-1;lam<=1;lam+=2){
        int g1=(g+1+role)%3,g2=(g+2-role)%3; memcpy(nb,cur,SZ); int ok=1;
        for(int c=0;c<9;c++){ int y=nb[27*i+9*g1+c]+lam*s*cur[27*j+9*g1+c]; int z=nb[27*j+9*g2+c]-lam*cur[27*i+9*g2+c];
          if(y>maxc||y<-maxc||z>maxc||z<-maxc){ ok=0; break; } nb[27*i+9*g1+c]=(i8)y; nb[27*j+9*g2+c]=(i8)z; }
        if(ok) push(nb,r); } }
    // splits (plus) from low rank-23 states
    if(r==23 && support(cur,23)<=s0+dplus){
      for(int i=0;i<23;i++)for(int j=0;j<23;j++){ if(i==j) continue; for(int g=0;g<3;g++){ if(par(cur+27*i+9*g,cur+27*j+9*g)) continue;
        for(int sg=-1;sg<=1;sg+=2){ memcpy(nb,cur,SZ); int ok=1; i8*nt=nb+27*23; memcpy(nt,cur+27*i,27);
          for(int c=0;c<9;c++){ int y=cur[27*i+9*g+c]-sg*cur[27*j+9*g+c]; if(y>maxc||y<-maxc){ ok=0; break; } nb[27*i+9*g+c]=(i8)y; nt[9*g+c]=(i8)(sg*cur[27*j+9*g+c]); }
          if(ok) push(nb,24); } } } }
  }
  fprintf(stderr,"finished: expanded %ld states %ld (r23 %ld r24 %ld) reductions %ld best %d complete %d\n",head,tail,n23,n24,nred,best,(head>=tail)&&!capped);
  return 0; }
