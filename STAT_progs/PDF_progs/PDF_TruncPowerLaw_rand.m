function x=PDF_TruncPowerLaw_rand(P,pdf_prams)
%% CALL: x=PDF_TruncPowerLaw_rand(P,pdf_prams);
%% generates a random number from
%% pdf for truncated power law distribution,
%% p=A*x^(-n1) if x\in[a,b], p=0 if x<a or x>b;
%% pdf_prams={a,n1,b};

DO_TEST  = 0;
if nargin==0%%do test
   P           = sort(rand(3e5,1));
   n1          = 0;
   pdf_prams   = {1,n1,10};
   DO_TEST     = 1;
elseif iscell(P)
   P=rand(P{1});
end

a     = pdf_prams{1};%% lower limit for x;
n1    = pdf_prams{2};
b     = pdf_prams{3};%% truncate dist at x=b;
A     = 1/int0(a,b,n1);%% normalising constant;

if n1==1
   x  = a*exp(P/A);
else
   s1 = 1-n1;
   x  = ( a^s1+s1*P/A ).^(1/s1);
end

if DO_TEST
%   F        = PDF_TruncPowerLaw_prob(x,pdf_prams);
%   tst_prob =[F,P]

   prams        = PDF_TruncPowerLaw_getprams(x);
   test_prams1  = [prams{1},a]
   test_prams2  = [prams{2},n1]
   test_prams3  = [prams{3},b]

   p           = PDF_TruncPowerLaw_pdf(x,pdf_prams);
   dx          =  0.001;
   xmax        =  b;
   X           = [1+dx/2:dx:xmax];
   PDF_normalised_hist(x,X);
   hold on;
   plot(x,p,'r');
   xlim([a xmax]);
   hold off;
end

function y=int0(a,x,n1)%=int_a^x t^{-n1}dt
if n1==1
   y = log(x/a);
else
   s=1-n1;
   y=(x.^s-a^s)/s;
end
