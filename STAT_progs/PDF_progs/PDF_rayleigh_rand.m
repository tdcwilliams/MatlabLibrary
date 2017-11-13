function x=PDF_rayleigh_rand(P,pdf_prams);

DO_TEST  = 0;
if nargin==0%%do test
   P           = sort(rand(1e4,1));
   pdf_prams   = {2.5};
   DO_TEST     = 1;
elseif iscell(P)
   P=rand(P{1});%,pause
end

sigsquared  = pdf_prams{1};
xsq         = -2*sigsquared*log(1-P);
x           = sqrt(xsq);

if DO_TEST
   F        = PDF_rayleigh_prob(x,pdf_prams);
   tst_prob =[F,P]
   %%
   ss       = PDF_rayleigh_getprams(x);
   tst_get  = [ss,sigsquared]

   p        = PDF_rayleigh_pdf(x,pdf_prams);
   PDF_normalised_hist(x,500);
   hold on;
   plot(x,p,'r');
   hold off;
end

