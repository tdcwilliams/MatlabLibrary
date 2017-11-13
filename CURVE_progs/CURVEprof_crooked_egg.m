function [dr,r,d2r,d3r,theta]=...
             CURVEprof_crooked_egg(t,crk_prams);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DO_TEST=0;
if nargin==0%% use some test arguments:
  DO_TEST=1;
  Nterms=80;
  Nint=2*Nterms+10;
  %%
  t=-1+( (0:Nint-1)'+.5 )*(2/Nint);
  kn=pi*(-Nterms:Nterms);
  DD=diag(1i*kn);
  EXP=exp(1i*t*kn);
  IP=(1/Nint)*EXP';
  %%
  col='k';
  crk_prams={[0.25 1 1]};
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sz=size(t);
if sz(1)>sz(2)%% column vector:
  t=t';
end
crk_prams=crk_prams{1};
if length(crk_prams)<2
  crk_prams=[1 1 1];
end
alp=crk_prams(1);
bet=crk_prams(2);
fac = pi/2;
if length(crk_prams)==3
  fac=fac*crk_prams(3);
end
%%
th = fac*(t+1);
rho = alp*cos(th).^3 + bet*sin(th).^3;
x_av=3/8*alp;
y_av=3/8*bet;
x=rho.*cos(th)- x_av;  %
y=rho.*sin(th)- y_av;  %
%%
fm=bet*sin(th)-alp*cos(th);
fp=alp*sin(th)+bet*cos(th);
%%
rho_dth = (3/2)*sin(2*th).*fm;
rho_dth2 = (3/2)*sin(2*th).*fp + ...
             + 3*cos(2*th).*fm;
rho_dth3 = -15/2*sin(2*th).*fm + ...
             + 6*cos(2*th).*fp;
%%
r=[x;y];
dx=cos(th).*rho_dth - sin(th).*rho;
dy=sin(th).*rho_dth + cos(th).*rho;
dr=[dx;dy];
%%
d2x=cos(th).*rho_dth2 - 2*sin(th).*rho_dth +...
      - cos(th).*rho;
d2y=sin(th).*rho_dth2 + 2*cos(th).*rho_dth +...
      - sin(th).*rho;
d2r=[d2x;d2y];
%%
d3x=cos(th).*rho_dth3 - 3*sin(th).*rho_dth2 +...
     - 3*cos(th).*rho_dth + sin(th).*rho;
d3y=sin(th).*rho_dth3 + 3*cos(th).*rho_dth2 +...
     - 3*sin(th).*rho_dth - cos(th).*rho;
d3r=[d3x;d3y];
%%
dr = fac*dr;
d2r = fac^2*d2r;
d3r = fac^3*d3r;
theta=angle(dr(1,:)+i*dr(2,:)).';
%%
if DO_TEST
  if 1
    scaler=[1 .8];
    translation=[.075 -.1];
    plot(scaler(1)*x+translation(1),...
         scaler(2)*y+translation(2),col);
    %%
    r=.3;
    x2=r*cos(pi*t);
    y2=r*sin(pi*t);
    hold on, plot(x2,y2,'m'), hold off;
  else
    %%
    cxap=IP*(x');
    xap=(EXP*cxap).';
    cdxap=DD*cxap;
    dxap=(EXP*cdxap).';
    cd2xap=DD*cdxap;
    d2xap=(EXP*cd2xap).';
    cd3xap=DD*cd2xap;
    d3xap=(EXP*cd3xap).';
    %%
    cyap=IP*(y');
    yap=(EXP*cyap).';
    cdyap=DD*cyap;
    dyap=(EXP*cdyap).';
    cd2yap=DD*cdyap;
    d2yap=(EXP*cd2yap).';
    cd3yap=DD*cd2yap;
    d3yap=(EXP*cd3yap).';
    %%
    subplot(4,2,1), plot(t,x);
    hold on, plot(t,xap,'--g'), hold off;
    subplot(4,2,3), plot(t,fac*dx);
    hold on, plot(t,dxap,'--g'), hold off;
    subplot(4,2,5), plot(t,fac^2*d2x);
    hold on, plot(t,d2xap,'--g'), hold off;
    subplot(4,2,7), plot(t,fac^3*d3x);
    hold on, plot(t,d3xap,'--g'), hold off;
    %%
    subplot(4,2,2), plot(t,y);
    hold on, plot(t,yap,'--g'), hold off;
    subplot(4,2,4), plot(t,fac*dy);
    hold on, plot(t,dyap,'--g'), hold off;
    subplot(4,2,6), plot(t,fac^2*d2y);
    hold on, plot(t,d2yap,'--g'), hold off;
    subplot(4,2,8), plot(t,fac^3*d3y);
    hold on, plot(t,d3yap,'--g'), hold off;
  end
end