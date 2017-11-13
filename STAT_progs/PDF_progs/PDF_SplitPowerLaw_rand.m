function x=PDF_SplitPowerLaw_rand(P,pdf_prams)
%% CALL: x=PDF_SplitPowerLaw_rand(P,pdf_prams);
%% generates a random number from
%% pdf for split power law distribution,
%% p=A*x^(-n1) if x\in[a,b], p=0 if x<a, p=B*x^(-n2);
%% pdf_prams={a,n1,b,n2,P0}, where P0 is prob(x\in[a,b]);

DO_TEST  = 0;
if nargin==0%%do test
   P           = sort(rand(3e5,1));
   n1          = -1;
   pdf_prams   = {1,n1,10,2.12,.4};
   DO_TEST     = 1;
elseif iscell(P)
   P=rand(P{1});
end

a     = pdf_prams{1};%% lower limit for x;
n1    = pdf_prams{2};
b     = pdf_prams{3};%% regime shift at x=b;
n2    = pdf_prams{4};
P0    = pdf_prams{5};
A     = P0/int0(a,b,n1);%% normalising constant: P(x\in[a,b])=P0;
B     = (1-P0)/int1(b,n2);%% normalising constant: P(x>b)=1-P0;

s1    = 1-n1;
s2    = 1-n2;
x     = 0*P;
%%
jj=find(P<=P0);
x(jj)=( a^s1+s1*P(jj)/A ).^(1/s1);
%%
jj=find(P>P0);
dP=P(jj)-P0;
x(jj)=( b^s2+s2*dP/B ).^(1/s2);

if DO_TEST
%   F        = PDF_SplitPowerLaw_prob(x,pdf_prams);
%   tst_prob =[F,P]

   prams       = PDF_SplitPowerLaw_getprams(x);
   test_prams1 = [prams{1},a]
   test_prams2 = [prams{2},n1]
   test_prams3 = [prams{3},b]
   test_prams4 = [prams{4},n2]
   test_prams5 = [prams{5},P0]

   p        = PDF_SplitPowerLaw_pdf(x,pdf_prams);
   dx       = 0.001;
   xmax     = 200;
   X        = [1+dx/2:dx:xmax];
   PDF_normalised_hist(x,X);
   hold on;
   plot(x,p,'r');
   xlim([a xmax]);
   hold off;
end

function y=int0(a,x,n1)%=int_a^x t^{-n1}dt
s=1-n1;
y=(x.^s-a^s)/s;

function y=int1(b,n2)%=int_b^\infty t^{-n2}dt
y=b.^(1-n2)/(n2-1);,
