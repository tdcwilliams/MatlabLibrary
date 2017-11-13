function p=PDF_powerlaw_pdf(x,pdf_prams)
%% CALL: p=PDF_powerlaw_pdf(x,pdf_prams);
%% gives pdf for power law distribution,
%% p=x^(-n)/A if x>=a, p=0 if x<a;
%% pdf_prams={a,n};
%%
%% if x=[], p is the mean.

a     = pdf_prams{1};%% lower limit for x;
n     = pdf_prams{2};%% 
A     = 1/int1(a,n);%% normalising constant
%%
if isempty(x)
   if n<2
      p=Inf;
   else
      p  = A*int1(a,n-1);
   end
   return;
end
p     = 0*x;
jp    = find(x>=a);
p(jp) = A*x(jp).^(-n);


function y=int0(a,x,n1)%=int_a^x t^{-n1}dt
s=1-n1;
y=(x.^s-a^s)/s;

function y=int1(x,n2)%=int_x^\infty t^{-n2}dt
y=x.^(1-n2)/(n2-1);,
