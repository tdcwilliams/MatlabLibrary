function [dr,r,d2r,d3r,theta]=POOLprof_teardrop(t,crk_prams);
%% CALL: [dr,r,d2r,d3r]=POOLprof_teardrop(t,crk_prams);
%% crk_prams={m}, m\in{1,2,...}, t\in[-1,1];
%%   m=1 => circle; m=2 non-singular teardrop:
%% gives a tear-drop shape y^2=x^n*(1-x) where n=2*m+1,
%%  or x=cos(pi*t), y=sin(pi*t)*( sin(pi*t/2) ).^(n-1)...
%%                   =2*cos(pi*t/2).*( sin(pi*t/2) ).^n;

n=crk_prams{1};
if n<1 || ~round(n)==n
  disp('error in POOLprof_teardrop.m: n=crk_prams{1} must be a natural number');
  return;
end
%%
theta=pi*(t+1);
x=cos(theta);
dx=-pi*sin(theta);
d2x=-pi^2*x;
d3x=-pi^2*dx;
%%
c=cos(theta/2);
s=sin(theta/2);
k=pi/2;%% theta/2=k*t

y=2*c.*s.^n;
%%
dy= - 2*k*(n+1)*s.^(n+1);
if n>=1
  dy = dy + 2*k*n*s.^(n-1);
end
% -------------------------- %
%%
d2y=-2*k^2*(n+1)^2*s.^n.*c;
if n>=2
  d2y=d2y+2*k^2*n*(n-1)*s.^(n-2).*c;
end
%%
d3y=2*k^3*(n+1)^3*s.^(n+1);
if n>=1
  d3y = d3y - 4*k^3*n*(n^2+1)^2*s.^(n-1);
end
if n>=3
  d3y = d3y + 2*k^3*n*(n-1)*(n-2)*s.^(n-3);
end

%% OUTPUTS:
r=[x,y]';
dr=[dx,dy]';
d2r=[d2x,d2y]';
d3r=[d3x,d3y]';

%% work out angle tangent vector makes with x-axis;
%%  NB need to take limit at end points:
theta=angle(dx+i*dy).';
jm1=find(t==-1);
if n>=3
  theta(jm1)=pi;
elseif n==2
  theta(jm1)=3*pi/4;
end
jp1=find(t==1);
if n>=3
  theta(jp1)=0;
elseif n==2
  theta(jp1)=pi/4;
end


if 0%%do test
  plot(x,y);
end
