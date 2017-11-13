function x=PDF_powerlaw_rand(P,pdf_prams)
%% CALL: x=PDF_powerlaw_rand(P,pdf_prams);
%% x is a random number from a power law distribution,
%% with pdf p=x^(-n)/A if x>=a, p=0 if x<a;
%% pdf_prams={a,n};

DO_TEST  = 0;
if nargin==0%%do test
   P           = sort(rand(3e5,1));
   pdf_prams   = {1,1.65};
   DO_TEST     = 1;
elseif iscell(P)
   P=rand(P{1});
end

a     = pdf_prams{1};%% lower limit for x;
n     = pdf_prams{2};%% 
A     = int1(a,n);%% normalising constant
%%
x     = a+0*P;
jp    = find(P);
%%
s1    = 1-n;
x(jp) = ( a^s1+s1*P(jp)*A ).^(1/s1);

if DO_TEST
%   F        = PDF_powerlaw_prob(x,pdf_prams);
%   tst_prob =[F,P]

   prams       = PDF_powerlaw_getprams(x);
   test_prams1  = [prams{1},a]
   test_prams2  = [prams{2},n]

   p        = PDF_powerlaw_pdf(x,pdf_prams);
   dx       = 0.001;
   xmax     = 200;
   X        = [1+dx/2:dx:200];
   PDF_normalised_hist(x,X);
   hold on;
   plot(x,p,'r');
   xlim([a xmax]);
   hold off;
end

function y=int0(a,x,n1)%=int_a^x t^{-n1}dt
s=1-n1;
y=(x.^s-a^s)/s;

function y=int1(x,n2)%=int_b^\infty t^{-n2}dt
y=x.^(1-n2)/(n2-1);,
