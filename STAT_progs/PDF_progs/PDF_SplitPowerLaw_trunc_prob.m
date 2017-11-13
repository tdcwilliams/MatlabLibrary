function p=PDF_SplitPowerLaw_trunc_pdf(x,pdf_prams)
%% CALL: p=PDF_SplitPowerLaw_trunc_pdf(x,pdf_prams);
%% gives pdf for split power law distribution,
%% p=A*x^(-n1) if x\in[a,b], p=0 if x<a, 
%% p=B*x^(-n2) if x\in(b,c], p=0 if x>c
%% pdf_prams={a,n1,b,n2,P0,c}, where P0 is prob(x\in[a,b]);
%%
%% if x=[], p=mean;

a  = pdf_prams{1};%% lower limit for x;
n1 = pdf_prams{2};
b  = pdf_prams{3};%% regime shift at x=b;
n2 = pdf_prams{4};
c  = pdf_prams{5};
P0 = pdf_prams{6};
%%
if c<=b
   p  = PDF_TruncPowerLaw_prob(x,{a,n1,c});
   return;
end

if isempty(P0)%%choose P0 to make pdf cts;
   p1 = PDF_TruncPowerLaw_pdf(b,{a,n1,b});
   p2 = PDF_TruncPowerLaw_pdf(b,{b,n2,c});
   P0 = 1/(1+p1/p2)
end

mu1            = PDF_TruncPowerLaw_prob(x,{a,n1,b});
mu2            = PDF_TruncPowerLaw_prob(x,{b,n2,c});
p              = P0*mu1+(1-P0)*mu2;
p(find(x==b))  = P0;
