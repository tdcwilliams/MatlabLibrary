function p=PDF_rayleigh_pdf(x,pdf_prams);
%% CALL: p=PDF_rayleigh_pdf(x,pdf_prams);
%% pdf for Rayleigh distribution is 
%% p=x/sig^2*exp(-x^2/2/sig^2);
%% pdf_prams={sig^2};
%%
%% if x=[], p is the mean.

sigsquared  = pdf_prams{1};
if isempty(x)
   p=sqrt(pi/2*sigsquared);
   return;
end
p           = 0*x;
jp          = find(x>=0);
p(jp)       = x(jp)/sigsquared.*exp(-x(jp).^2/2/sigsquared);
