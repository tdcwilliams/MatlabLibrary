function [dr,r,d2r,d3r]=CRK_strtline(t,crk_prams);

t=t';
%%x\in[a,b]:
x=t;
y=0*t;
r=[x;y];

%%calc 1st deriv's:
dx=y+1;
dy=y;
dr=[dx;dy];

%%calc 2nd & 3rd deriv's (zero):
d2x=y;
d2y=y;
d2r=[d2x;d2y];
d3r=d2r;