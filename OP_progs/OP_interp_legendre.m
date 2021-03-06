function f=OP_interp_legendre(tt,An)
%% call y=GEN_interp_legendre(tt,An)
%% IF An is a vector, it should contain
%% the coefficients of the legendre polynomials,
%% and y=sum_{n=0}^NgP A_nP_n(tt);
%% 
%% ELSE An can be a cell {NgP} and y is a matrix with
%% n-th column P_n(tt).
%% 
%% tt are the values the expansion is to be evaluated at
%% (in an interval scaled to [-1,1])

if ~iscell(An)
  NgP=length(An)-1;
  f=0*tt;
  P0=f;

  P1=1+f;
  f=f+An(1)*P1;

  for its=1:NgP
    Pn=(2-1/its)*tt.*P1-(1-1/its)*P0;
    f=f+An(its+1)*Pn;
    P0=P1;
    P1=Pn;
  end
else
  NgP=An{:};
  f=ones(length(tt),NgP+1);
  if NgP<0
    return;
  end

  P0=0*tt;
  P1=1+P0;

  for its=1:NgP
    Pn=(2-1/its)*tt.*P1-(1-1/its)*P0;
    f(:,its+1)=Pn;
    P0=P1;
    P1=Pn;
  end
end
