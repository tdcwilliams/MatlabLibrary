function x=PDF_exponential_rand(P,pdf_prams);
%% CALL: x=PDF_exponential_rand(P,pdf_prams);
%% x is a random variable that follows
%% the pdf for exponential distribution, 
%% p=1/lam*exp(-x/lam);
%%
%% pdf_prams={lam};
%%
%% P can be a matrix of uniformly
%%  distributed random numbers, or a
%%  cell {[n1,n2]), where x is an (n1 x n2)
%%  matrix;

DO_TEST  = 0;
if nargin==0%%do test
   P           = sort(rand(1e4,1));
   pdf_prams   = {5};
   DO_TEST     = 1;
elseif iscell(P)
   P=rand(P{1});
end


lam   = pdf_prams{1};
x     = -lam*log(1-P);

if DO_TEST
   F        = PDF_exponential_prob(x,pdf_prams);
   tst_prob = [F,P]
   %%
   xm       = PDF_exponential_getprams(x);
   tst_get  = [xm,lam]

   p        = PDF_exponential_pdf(x,pdf_prams);
   PDF_normalised_hist(x,500);
   hold on;
   plot(x,p,'r');
   hold off;
end
