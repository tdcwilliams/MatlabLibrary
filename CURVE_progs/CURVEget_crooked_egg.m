function out=CURVEget_crooked_egg(alp,bet,perimeter,rot,centre,orientation)

if nargin==5%%default curve orientation is anti-clockwise
  orientation=1;
end

fxn=@CURVEprof_circarc;
scaler=[1 1];
srt={scaler,rot,centre};
prams=[alp,bet,orientation];
out={fxn,prams,srt};
%%
L=CURVE_arclength(out);
out{3}{1}=perimeter/L*out{3}{1};