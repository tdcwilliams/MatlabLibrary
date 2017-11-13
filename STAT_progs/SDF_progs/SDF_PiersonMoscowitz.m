function [S,Hs] = SDF_PiersonMoscowitz(omega,sdf_prams);
%% CALL: [S,Hs] = SDF_PiersonMoscowitz(omega,sdf_prams);
%% sdf_prams={peak period, moment number};

Tm          = sdf_prams{1};

if length(sdf_prams)==1
   moment_no   = 0;
else
   moment_no   = sdf_prams{2};
end

g           = 9.81;
Hs          = g.*(0.4.*Tm./(2.*pi)).^2;
aa          = 8.1e-3*g^2;    % Ochi (1998)
bb          = 5/4;
T           = 2*pi./omega;
S           = aa.*omega.^(moment_no-5).*exp(-bb.*(T./Tm).^4);
