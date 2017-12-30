function z = Conv(x, y, w, t)
%Conv Summary of this function goes here
%   Detailed explanation goes here

% Don't change the function signature

% convolution = F-1{ F{x} * F{y} }
X = fourierTransform(x, w, t);
Y = fourierTransform(y, w, t);
f_product = X .* Y;
z = invFourierTransform(f_product, w, t);

end

