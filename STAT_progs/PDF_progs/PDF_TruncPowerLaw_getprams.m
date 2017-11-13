function pdf_prams=PDF_TruncPowerLaw_getprams(x,b);
%% NB if wish to fix b, call as:
%% pdf_prams=PDF_powerlaw_getprams(x,b);

a           = min(x);
if nargin==1
   b        = max(x);
end
%%
A           = log(a);
B           = log(b);
lhat        = mean(log(x));

alp         = 0;

%% get bounds for zero;
a1          = -1/(B-lhat);%%<0
a2          = 1/(lhat-A);%%>0
fn_prams    = {lhat,A,B};

%% look for alp>0:
nn          = 0;
maxreps     = 10;
df          = 1;
while df>0 & nn<maxreps;
   nn    = nn+1;
   [ff,df]     = feval(@fxn_with_zero,.1^nn*a2,fn_prams);
end
if df<0%% we have found an interval with a root;
       %% find root and exit;
   interval    = [.1^nn 1]*a2;
   alp   = GEN_findroot_bisection(@fxn_with_zero,interval,fn_prams);
   n           = alp+1;
   pdf_prams   = {a,n,b};
   return;
end

%% look for alp<0:
nn          = 0;
df          = 1;
while df>0 & nn<maxreps;
   nn    = nn+1;
   [ff,df]     = feval(@fxn_with_zero,.1^nn*a1,fn_prams);
end
if df<0%% we have found an interval with a root;
       %% find root and exit;
   interval    = [1 .1^nn]*a1;
   alp   = GEN_findroot_bisection(@fxn_with_zero,interval,fn_prams);
   n           = alp+1;
   pdf_prams   = {a,n,b};
   return;
end

%% if we haven't found a root yet, then alp=0;
pdf_prams      = {a,1,b};

if 0
   np          = 50;
   aa          = -5*guess+(0:np)'/np*(10*guess);
   [ff,df]     = feval(@fxn_with_zero,aa,fn_prams);
   plot(aa,ff), hold on;
   plot(aa,0*aa,'k');
   plot(guess,0,'.r');
   %%
   jp          = find(aa>0);
   ap          = aa(jp);
   plot(ap,(lhat-A)*ap-1,'r');
   %%
   jm          = find(aa<0);
   am          = aa(jm);
   plot(am,1+(B-lhat)*am,'g');
   ylim([-10 10]);
   xlim([-2 2]);
   hold off;
   %%
   figure;
   plot(aa,df), hold on;
   plot(aa,0*aa,'k'), hold off;

   C=B-A;
   feval(@fxn_with_zero,[0;1/C],fn_prams)
   pause
end

if 0
   nn       = 1;
   interval = sort([.1^nn 3]*guess);
   ff       = feval(@fxn_with_zero,interval,fn_prams)
   pause
   while prod(ff)>0
      nn       = nn+1;
      interval = sort([.1^nn 3]*guess);
      ff       = feval(@fxn_with_zero,interval,fn_prams)
      pause
   end
   alp   = GEN_findroot_bisection(@fxn_with_zero,interval,fn_prams)
   pause
elseif 0
   alp   = GEN_findroot_NR(@fxn_with_zero,guess,fn_prams);
end

function [f,df]=fxn_with_zero(alp,prams);

lhat  = prams{1};
A     = prams{2};
B     = prams{3};
C     = B-A;
%%
jm    = find(alp<0);
jp    = find(alp>=0);
ff    = 0*alp;
df    = ff;

if ~isempty(jp)
   ap       = alp(jp);
   ex       = exp(-C*ap);
   f(jp)    = (ap*lhat-1).*(1-ex)-ap.*(A-B*ex);
   df(jp)   = lhat*(1-ex)+C*ex.*(ap*lhat-1)+...
               -(A-B*ex)-ap.*(B*C*ex); 
end
if ~isempty(jm)
   am       = alp(jm);
   ex       = exp(C*am);
   f(jm)    = (am*lhat-1).*(ex-1)-am.*(A*ex-B);
   df(jm)   = lhat*(ex-1)+C*ex.*(am*lhat-1)+...
              -(A*ex-B)-am.*(A*C*ex); 
end
