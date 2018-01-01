function x = invFourierTransform(X, w, t)
%INVFOURIERTRANSFORM computes the inverse fourier transform:

% Inputs:
%   w - frequency stamps
%   t - time stamps
%   X - Fourier tranform
% Output:
%   X - time series

% Don't change the function signature

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% - "Can be done in one line..." -
% (Clue: duality of the Fourier transform - use function X = fourierTransform( x,w,t )
% Don't forget a factor of 1/2/pi for the inverse transform..
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


x = real(1/(2*pi) * fourierTransform(X, -t, w));

end

