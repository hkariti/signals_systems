function X = fourierTransform(x, w, t)
%FOURIERTRANSFORM computes the fourier transform of a signal:
% Inputs:
%   t - time stamps
%   w - vector of frequencies
%   x - time series
% Output:
%   X - Transform

% Don't change the function signature

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Write your code using matrix multiplication only
% No control loops (for, while, etc..)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Ensure vectors are columns
x = x(:);
w = w(:);
t = t(:);

%% Calculate matrix of PHIs
% Get a matrix of the exponent part (column x row = matrix), each column is
% a freq over time
phis = 1j * t * transpose(w);
% Now raise as a power of e
phis = exp(phis);
%% Get delta-t
dt = t(2)-t(1);

%% Calculate transform
X = phis'*x*dt;


end

