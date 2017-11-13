function pdf_prams=PDF_powerlaw_getprams(x,a)
%% CALL: pdf_prams=PDF_powerlaw_getprams(x)
%% estimates using maximum likelihood
%% (http://en.wikipedia.org/wiki/Pareto_distribution)
%% parameters for the pdf for the power law distribution,
%% p=x^(-n)/A if x>=a, p=0 if x<a;
%% pdf_prams={a,n};
%% NB if wish to fix a, call as:
%% pdf_prams=PDF_powerlaw_getprams(x,a);

if nargin==1
   a        = min(x);
end
N           = length(x);
n           = 1+N/sum(log(x)-log(a));

pdf_prams   = {a,n};
