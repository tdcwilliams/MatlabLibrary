function [dr,r,d2r,d3r]=CRK_cheby(t,crk_prams);

%t=t';
n=crk_prams{1};%%index n of y=T_n(t)
An(n+1,1)=1;
alp=0;

%%x(t),y(t)
x=t';
y=OP_interp_chebyshev(t,An)';
r=[x;y];

%%x'(t),y'(t)
dx=1+0*x;
[An1,alp1]=OP_diff_gegenbauer(alp,{An},1);
dy=OP_interp_gegenbauer(t,alp1,An1)';
dr=[dx;dy];

%%x''(t),y''(t)
d2x=dx-1;
[An2,alp2]=OP_diff_gegenbauer(alp1,{An1},1);
d2y=OP_interp_gegenbauer(t,alp2,An2)';
d2r=[d2x;d2y];

%%x'''(t),y'''(t)
d3x=d2x;%%=0
[An3,alp3]=OP_diff_gegenbauer(alp2,{An2},1);
d3y=OP_interp_gegenbauer(t,alp3,An3)';
d3r=[d3x;d3y];