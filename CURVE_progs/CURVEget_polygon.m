function out=CURVEget_polygon(N,radius,rot,centre,orientation)

thvec=(0:N)*(2*pi/N);
zvec=centre+radius*exp(1i*(thvec+rot));
if nargin==4
  orientation=1;
end
if orientation==-1
  zvec=fliplr(zvec);
end
%%
for j=1:N
  z1=zvec(j);
  z2=zvec(j+1);
  out(j,:)=CURVEget_strtline(z1,z2);
end