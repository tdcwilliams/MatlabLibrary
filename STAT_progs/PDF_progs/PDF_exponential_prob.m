function F=PDF_exponential_prob(x,pdf_prams);
%% CALL: F=PDF_exponential_pdf(x,pdf_prams);
%% given X follows the pdf for
%exponential distribution,
%% p=1/lam*exp(-x/lam), F=P(X,x);
%% pdf_prams={lam};

lam         = pdf_prams{1};
F           = 0*x;
jp          = find(x>=0);
F(jp)       = 1-exp(-x(jp)/lam);
