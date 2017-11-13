function F=PDF_rayleigh_prob(x,pdf_prams);

sigsquared  = pdf_prams{1};
F           = 0*x;
jp          = find(x>=0);
F(jp)       = 1-exp(-x(jp).^2/2/sigsquared);
