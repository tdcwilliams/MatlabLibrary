function pdf_prams=PDF_SplitPowerLaw_getprams(x);

a           = min(x);
b           = fminbnd(@(b)log_likelihood_fn(b,x),min(x),max(x));
pdf_prams   = getprams(b,x);

function el = log_likelihood_fn(b,x);

pdf_prams   = getprams(b,x);
p           = PDF_SplitPowerLaw_pdf(x,pdf_prams);
el          = -mean(log(p));

function pdf_prams = getprams(b,x);
a           = min(x);
x1          = x(find(x<=b));
N1          = length(x1);
%%
x2          = x(find(x>b));
N2          = length(x2);
P0          = N1/(N1+N2);
%%
prams2      = PDF_powerlaw_getprams(x2,b);
n2          = prams2{2};
%%
prams1      = PDF_TruncPowerLaw_getprams(x1,b);
n1          = prams1{2};
pdf_prams   = {a,n1,b,n2,P0};
