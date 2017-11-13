function F=PDF_TruncPowerLaw_prob(x,pdf_prams)
%% CALL: F=PDF_TruncPowerLaw_prob(x,pdf_prams);
%% if X follows a truncated power law distribution
%% ( pdf: p=A*x^(-n1) if x\in[a,b], p=0 if x<a, or x>b; 
%% F=prob(X<x);
%% pdf_prams={a,n1,b};

a     = pdf_prams{1};%% lower limit for x;
n1    = pdf_prams{2};
b     = pdf_prams{3};%% regime shift at x=b;
A     = 1/int0(a,b,n1);%% normalising constant;
%%
F     = 0*x;
j1    = find(x>=a & x<b);
F(j1) = A*int0(a,x(j1),n1);
%%
j2    = find(x>=b);
F(j2) = 1;

function y=int0(a,x,n1)%=int_a^x t^{-n1}dt
if n1==1
   y = log(x/a);
else
   s=1-n1;
   y=(x.^s-a^s)/s;
end
