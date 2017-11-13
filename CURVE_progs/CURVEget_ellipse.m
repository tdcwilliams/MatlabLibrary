function out=CURVEget_ellipse(a,b,rot,centre,orientation)
%% CALL out=CURVEget_ellipse(a,b,rot,centre,orientation);
%% a,b are length of semi-axes;
%% rot is rotation of ellipse IN DEGREES:
%%  rot=0 => semi-axis of length a is parallel to x axis;
%% orientation=1 => anti-clockwise;
%%  any other value => clockwise;

if nargin==4%%default curve orientation is anti-clockwise
  orientation=1;
end

fxn=@CURVEprof_circarc;
scaler=[a b];
srt={scaler,rot,centre};
prams=[1,orientation];
out={fxn,prams,srt};