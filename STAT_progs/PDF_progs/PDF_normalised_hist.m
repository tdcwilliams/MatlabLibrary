function PDF_normalised_hist(x,varargin);

[N,X] = feval(@hist,x,varargin{:});
dX    = X(2:end)-X(1:end-1);
Area  = N(1:end-1)*dX';

plot(X(1:end-1),N(1:end-1)/Area);
