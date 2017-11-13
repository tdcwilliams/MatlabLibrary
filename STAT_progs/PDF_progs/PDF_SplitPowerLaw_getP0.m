function PDF_prams = PDF_SplitPowerLaw_getP0(Dmax,Pmax,PDF_prams);
if nargin==0
   Dmax        = 30;
   Pmax        = .95;
   %%
   a           = 20;
   b           = 50;
   n1          = 1.15;
   n2          = 2.5;
   PDF_prams   = {a,n1,b,n2};
end

a  = PDF_prams{1};
n1 = PDF_prams{2};
b  = PDF_prams{3};
n2 = PDF_prams{4};

if Dmax==b
   P0 = Pmax;
elseif Dmax<b
   P1 = PDF_TruncPowerLaw_prob(Dmax,{a,n1,b});%%P0*P1=P(D<Dmax)=Pmax;
   P0 = Pmax/P1;
   if P0>1%%reduce b:
      P0    = 1;
      gam   = 1-n1;
      b     = ( (Dmax^gam-a^gam*(1-Pmax))/Pmax )^(1/gam);
   end
else
   P1 = PDF_powerlaw_prob(Dmax,{b,n2});%%(1-P0)*(1-P1)=P(D>Dmax)=1-Pmax;
   P0 = (Pmax-P1)/(1-P1);
   if P0<0%% increase b:
      P0    = 0;
      gam   = 1-n2;
      b     = Dmax/(1-Pmax)^(1/gam);
   end
end
PDF_prams   = {a,n1,b,n2,P0};

if 0
   PDF_prams{5}   = P0;
   Pmax  = [Pmax,PDF_SplitPowerLaw_prob(Dmax,PDF_prams)]
   P0    = [P0,PDF_SplitPowerLaw_prob(b,PDF_prams)]
   Dav   = PDF_SplitPowerLaw_pdf([],PDF_prams)
end
