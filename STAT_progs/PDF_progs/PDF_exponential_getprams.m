function pdf_prams=PDF_exponential_getprams(x);
%% CALL: pdf_prams=PDF_exponential_getprams(x);
%% uses max likelihood to get the best
%% fit of an exponential dist to data
%% (pdf = e^(-x/lam)/lam);

pdf_prams   = {mean(x)};
