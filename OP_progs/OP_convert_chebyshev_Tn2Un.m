function M = OP_convert_chebyshev_Tn2Un(Np,dirn)
%% CALL: M = OP_convert_chebyshev_Tn2Un(Np,dirn)
%% Np is the order of the poly expansion;
%% M is a matrix:
%%  dirn==0: turns Tn coeffs -> Un coeffs;
%%  dirn==1: turns Un coeffs -> Tn coeffs.

if dirn==0% Matrix changes Tn coeff's to Un coeff's:
   M           = .5*eye(Np+1);
   jj          = 1:Np-1;
   M(jj+2,jj)  = M(jj+2,jj)-M(jj,jj);
   M(1)        = 1;
else% Matrix turns Un coeff's to Tn coeff's:
   D     =2*eye(Np+1);
   D(1)  = 1;
   n0    = 3;
   N     = Np-1;
   M     = D;
   while n0<=Np+1
      jj          = n0:Np+1;
      M(jj,1:N)   = M(jj,1:N)+D(1:N,1:N);
      n0          = n0+2;
      N           = N-2;
   end
end
