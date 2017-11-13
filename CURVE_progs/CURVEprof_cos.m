function [dr,r,d2r,d3r,theta]=...
    CURVEprof_cos(t,crk_prams);
%% CALL: [dr,r,d2r,d3r,theta]=...
%%  CURVEprof_cos(t,crk_prams);
%% dr=r'(t), r(t)=[x(t);y(t)],
%%  d2r=r''(t), d3r=r'''(t),
%%  theta is angle that the vector dr points in radians;
%% t\in[-1,1] is the crack parameter;
%% crk_prams={alf,phi}, alf is the fraction of a cosine the crack
%%  arc covers, phi is a phase shift (0 is a cos curve, 1 a sin curve);
%%  NB the 'opening' of the arc points to the right by default,
%%  but can be rotated;

do_tst   = 0;
if nargin==0
   np          = 100;
   t           = linspace(-1,1,np)';
   alf         = 1;
   phi         = 0;
   crk_prams   = {alf,phi};
   do_tst      = 1;
end
t     = t';
alf   = prod(crk_prams{1});
phi   = crk_prams{2};
k     = pi*alf;

x     = t;
dx    = 1+0*t;
d2x   = 0*t;

t2    = t-phi/2;
y     = cos(k*t2);
dy    = -k*sin(k*t2);
d2y   = -k^2*cos(k*t2);
d3y   = k^3*sin(k*t2);

r     = [x;y];
dr    = [dx;dy];
d2r   = [d2x;d2y];
d3r   = [d2x;d3y];%%NB d3x=d2x=0
theta = angle(dr(1,:)+1i*dr(2,:)).';

if do_tst
   subplot(1,4,1)
   plot(x,y)
   hold on, plot(x,0*x,'k'), hold off;
   %%
   subplot(1,4,2)
   plot(t,dy)
   hold on, plot(t,0*t,'k'), hold off;
   %%
   subplot(1,4,3)
   plot(t,d2y)
   hold on, plot(t,0*t,'k'), hold off;
   %%
   subplot(1,4,4)
   plot(t,d3y)
   hold on, plot(t,0*t,'k'), hold off;
end
