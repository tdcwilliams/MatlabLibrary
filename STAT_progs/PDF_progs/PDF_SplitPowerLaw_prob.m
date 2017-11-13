function F=PDF_SplitPowerLaw_prob(x,pdf_prams)
%% CALL: F=PDF_SplitPowerLaw_prob(x,pdf_prams);
%% if X follows a split power law distribution
%% ( pdf: p=A*x^(-n1) if x\in[a,b], p=0 if x<a, p=B*x^(-n2) ),
%% F=prob(X<x);
%% pdf_prams={a,n1,b,n2,P0}, where P0 is prob(x\in[a,b]) );

a     = pdf_prams{1};%% lower limit for x;
n1    = pdf_prams{2};
b     = pdf_prams{3};%% regime shift at x=b;
n2    = pdf_prams{4};
P0    = pdf_prams{5};
A     = P0/int0(a,b,n1);%% normalising constant: P(x\in[a,b])=P0;
B     = (1-P0)/int1(b,n2);%% normalising constant: P(x>b)=1-P0;
%%
F     = 0*x;
j1    = find(x>=a & x<b);
F(j1) = A*int0(a,x(j1),n1);
%%
j2    = find(x>=b);
F(j2) = P0+B*int0(b,x(j2),n2);

function y=int0(a,x,n1)%=int_a^x t^{-n1}dt
s=1-n1;
y=(x.^s-a^s)/s;

function y=int1(x,n2)%=int_b^\infty t^{-n2}dt
y=x.^(1-n2)/(n2-1);,
