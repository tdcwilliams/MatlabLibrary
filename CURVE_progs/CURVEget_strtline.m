function out=CURVEget_strtline(z1,z2)

fxn=@CURVEprof_strtline;
%%
dz=z2-z1;
L=abs(dz)/2;
rot=180/pi*angle(dz);
centre=(z1+z2)/2;
%%
srt={L*[1 1],rot,centre};
out={fxn,[],srt};