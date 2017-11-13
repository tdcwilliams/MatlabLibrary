function p=PDF_TruncPowerLaw_pdf(x,pdf_prams)
%% CALL: p=PDF_TruncPowerLaw_pdf(x,pdf_prams);
%% gives pdf for truncated power law distribution,
%% p=A*x^(-n1) if x\in[a,b], p=0 if x<a or x>b;
%% pdf_prams={a,n1,b};
%%
%% if x=[], p is the mean.

a     = pdf_prams{1};%% lower limit for x;
n1    = pdf_prams{2};
b     = pdf_prams{3};%% truncate dist at x=b;
A     = 1/int0(a,b,n1);%% normalising constant; 
%%
if isempty(x)
   p  = A*int0(a,b,n1-1);
   return;
end
p     = 0*x;
j1    = find(x>=a & x<=b);
p(j1) = A*x(j1).^(-n1);

function y=int0(a,x,n1)%=int_a^x t^{-n1}dt

if n1==1
   y = log(x/a);
else
   s = 1-n1;
   y = (x.^s-a^s)/s;
end
