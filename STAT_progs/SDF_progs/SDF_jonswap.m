function [S,Hs,Tm]=SDF_jonswap(om,SDF_prams);
%% CALL: [S,Hs,Tm]=SDF_jonswap(om,SDF_prams);
%% SDF_prams={U10,F,moment_no} 
%%  or SDF_prams={ {Tm},{Hs},moment_no };
%% U10 [m.s^-1] is wind velocity at height 10m above sea;
%% F [km] is fetch (distance from a lee shore, or region over
%%  which wind blows at a constant velocity);
%% Tm is peak period;
%% Hs is sig wave height;
%% if moment_no~=0, S=S*omega^moment_no
%% - this gives integrand for higher moments;

DO_TEST  = 0;
if nargin==0
   DO_TEST     = 1;
   period      = (.1:.1:20)';
   om          = 2*pi./period;
   freq        = 1./period;
   U10         = 10;
   F           = 460;
   SDF_prams   = {U10,F};
elseif isempty(om)
   DO_TEST     = 1;
   period      = (.1:.1:20)';
   om          = 2*pi./period;
   freq        = 1./period;
end

U10         = SDF_prams{1};
F           = SDF_prams{2};
moment_no   = 0;
if length(SDF_prams)==3
   moment_no   = SDF_prams{3};
end
%%
if iscell(U10)
   Tm    = U10{1};
   Hs    = F{1};
   %%
   x     = Hs^2*g/16/1.67e-7;%% = U10^2*F;
   y     = g^2*(11*Tm/pi)^3;%% = U10*F;
   U10   = x/y;
   F     = y^2/x;
end
%%
g        = 9.81;
alp      = 0.076*(U10^2/F/g)^.22;
bet      = alp*g^2.*om.^(moment_no-5);
gam      = 3.3;
%%
om_p     = 22*(g^2/U10/F)^(1/3);
sig      = .07+0*om;
jj       = find(om>om_p);
sig(jj)  = .09;
rr       = exp( -(om/om_p-1).^2./(2*sig.^2) );
%%
S        = bet.*(gam.^rr).*exp(-1.25*(om_p./om).^4);
Tm       = 2*pi/om_p;
Hs       = 4*sqrt(1.67e-7*U10^2*F/g);

if DO_TEST
%   plot(period,S);
   plot(freq,S);
   xlim([0 0.7]);
end
