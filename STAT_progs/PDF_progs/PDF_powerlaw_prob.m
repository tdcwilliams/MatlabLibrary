function F=PDF_powerlaw_prob(x,pdf_prams)
%% CALL: F=PDF_powerlaw_prob(x,pdf_prams);
%% F=P(X<x) where X follows a power law distribution,
%% with pdf p=x^(-n)/A if x>=a, p=0 if x<a;
%% pdf_prams={a,n};

a     = pdf_prams{1};%% lower limit for x;
n     = pdf_prams{2};%% 
A     = int1(a,n);%% normalising constant
%%
F     = 0*x;
jp    = find(x>=a);
F(jp) = int0(a,x(jp),n)/A;


function y=int0(a,x,n1)%=int_a^x t^{-n1}dt
s=1-n1;
y=(x.^s-a^s)/s;

function y=int1(x,n2)%=int_b^\infty t^{-n2}dt
y=x.^(1-n2)/(n2-1);,
