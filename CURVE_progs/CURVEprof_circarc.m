function [dr,r,d2r,d3r,theta]=...
  CURVEprof_circarc(t,crk_prams);

t=t';
%%x\in[a,b]:
alf=prod(crk_prams{1});
k=pi*alf;

x=cos(k*t);
y=sin(k*t);

r=[x;y];
dr=[0 -k;k 0]*r;
d2r=-k^2*r;
d3r=-k^2*dr;
theta=angle(dr(1,:)+i*dr(2,:)).';