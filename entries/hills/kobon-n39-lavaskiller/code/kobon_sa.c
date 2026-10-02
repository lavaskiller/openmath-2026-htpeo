// Simulated annealing on n lines (cos t x + sin t y = d) maximising bounded triangular faces
// (same combinatorial rule as the hill's eval.py for simple arrangements). Floating point with a
// degeneracy guard; winners are re-verified exactly in Python (to_solution.py).
// usage: kobon_sa start.txt out_prefix seed seconds temp   (start: n, then n lines "theta d")
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <stdint.h>
#define MAXN 100
static int n; static double th[MAXN], dd[MAXN];
static uint64_t rs;
static inline uint64_t rnd(void){ rs ^= rs << 13; rs ^= rs >> 7; rs ^= rs << 17; return rs; }
static inline double urand(void){ return (rnd() >> 11) * (1.0 / 9007199254740992.0); }
static double gauss(void){ double u=urand()+1e-300,v=urand(); return sqrt(-2*log(u))*cos(6.283185307179586*v); }
static double tt[MAXN][MAXN]; static int ord[MAXN][MAXN], pos[MAXN][MAXN];
static const double GUARD=1e-7;
static int cmp_line; static int cmpf(const void*a,const void*b){ double x=tt[cmp_line][*(const int*)a],y=tt[cmp_line][*(const int*)b]; return x<y?-1:(x>y); }
// recompute line i's ordering; returns 0 if degenerate
static int order_line(int i){
  double ci=cos(th[i]),si=sin(th[i]); int m=0;
  for(int j=0;j<n;j++){ if(j==i) continue; double cj=cos(th[j]),sj=sin(th[j]); double w=ci*sj-si*cj; if(fabs(w)<1e-9) return 0;
    double x=(dd[i]*sj-dd[j]*si)/w, y=(ci*dd[j]-cj*dd[i])/w; tt[i][j]=-si*x+ci*y; ord[i][m++]=j; }
  cmp_line=i; qsort(ord[i],m,sizeof(int),cmpf);
  for(int a=0;a<m;a++){ pos[i][ord[i][a]]=a; if(a && tt[i][ord[i][a]]-tt[i][ord[i][a-1]] < GUARD*(1+fabs(tt[i][ord[i][a]]))) return 0; }
  return 1; }
static int count(void){
  int c=0;
  for(int i=0;i<n;i++) for(int a=0;a+1<n-1;a++){ int j=ord[i][a],k=ord[i][a+1]; if(j<i||k<i) continue;
    int dj=pos[j][i]-pos[j][k], dk=pos[k][i]-pos[k][j]; if((dj==1||dj==-1)&&(dk==1||dk==-1)) c++; }
  return c; }
static int full(void){ for(int i=0;i<n;i++) if(!order_line(i)) return -1; return count(); }
static void save(const char*p,int c,double*bt,double*bd){ char fn[512]; snprintf(fn,sizeof fn,"%s_%d.txt",p,c); FILE*f=fopen(fn,"w"); if(!f)return; fprintf(f,"%d\n",n); for(int i=0;i<n;i++) fprintf(f,"%.17g %.17g\n",bt[i],bd[i]); fclose(f); }
int main(int argc,char**argv){
  if(argc<6) return 0; FILE*f=fopen(argv[1],"r"); if(!f) return 0; if(fscanf(f,"%d",&n)!=1) return 0;
  for(int i=0;i<n;i++) if(fscanf(f,"%lf %lf",&th[i],&dd[i])!=2) return 0; fclose(f);
  rs=strtoull(argv[3],0,10)*0x9E3779B97F4A7C15ULL+777; double secs=atof(argv[4]),T=atof(argv[5]);
  int cur=full(); fprintf(stderr,"start %d\n",cur); if(cur<0){ fprintf(stderr,"degenerate start\n"); return 0; }
  int best=cur; static double bt[MAXN],bd[MAXN]; memcpy(bt,th,sizeof th); memcpy(bd,dd,sizeof dd); save(argv[2],best,bt,bd);
  time_t t0=time(0); unsigned long it=0;
  while(1){ it++; if((it&0x3FFF)==0 && difftime(time(0),t0)>secs) break;
    if(it%50000000UL==0){ fprintf(stderr,"it %lu cur %d best %d\n",it,cur,best); }
    int i=rnd()%n; double ot=th[i],od=dd[i]; double sg=pow(10.0,-(0.3+4.2*urand()));
    int mode=rnd()%4; if(mode==0) th[i]+=sg*gauss(); else if(mode==1) dd[i]+=sg*gauss(); else { th[i]+=sg*gauss(); dd[i]+=sg*gauss(); }
    int c=full();
    if(c>=0 && (c>=cur || urand()<exp((c-cur)/T))){ cur=c; if(c>best){ best=c; memcpy(bt,th,sizeof th); memcpy(bd,dd,sizeof dd); save(argv[2],best,bt,bd); fprintf(stderr,"best %d it %lu t=%.0f\n",best,it,difftime(time(0),t0)); fflush(stderr);} }
    else { th[i]=ot; dd[i]=od; full(); }
  }
  fprintf(stderr,"done it %lu best %d\n",it,best); return 0; }
