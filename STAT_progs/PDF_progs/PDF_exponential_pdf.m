function p=PDF_exponential_pdf(x,pdf_prams);
%% CALL: p=PDF_exponential_pdf(x,pdf_prams);
%% pdf for exponential distribution is 
%% p=1/lam*exp(-x/lam);
%% pdf_prams={lam};
%%
%% if x=[], p is the mean.

lam  = pdf_prams{1};
if isempty(x)
   p  = lam;
   return;
end
p           = 0*x;
jp          = find(x>=0);
p(jp)       = 1/lam*exp(-x(jp)/lam);
