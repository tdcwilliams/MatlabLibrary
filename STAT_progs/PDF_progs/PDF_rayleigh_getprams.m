function pdf_prams=PDF_rayleigh_getprams(x)

N           = length(x);
sigsquared  = sum(x.^2)/2/N;
pdf_prams   = {sigsquared};
