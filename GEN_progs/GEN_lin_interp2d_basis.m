function y = GEN_lin_interp2d_basis(t1,t2,M);

y  = M(2,1)*(1-t1)*(1-t2)'+...
     +M(2,2)*(t1)*(1-t2)'+...
     +M(1,2)*(t1)*(t2)'+...
     +M(1,1)*(1-t1)*(t2)';
