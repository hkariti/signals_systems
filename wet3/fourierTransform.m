function X = fourierTransform( x,w,t )
%FOURIERTRANSFORM computes the fourier transform of a signal:
% Inputs:
%   t - time stamps
%   w - vector of frequencies
%   x - time series
% Output:
%   X - Transform

x = x(:);
t = t(:);
w = w(:);

dt = t(2)-t(1); %Resolution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Write your code using matrix multiplication only
% No control loops (for,while,etc..)

phi = exp(1j*t*w'); % <-- Each column is a single harmoic function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


X = phi'*x*dt; % <-- We have already seen in class

end

