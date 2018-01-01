function x = makeNote(n, T, dt)
%MAKENOTE Creates a musical note in the form of a digital signal

% Inputs:
%   n   <integer> (negative or positive) denoting the distance to
%       the "La" key in Ovtaves.
%   T   <float array> The time interval
%   dt  Time resolution gap

% Outputs:
%   x   <float array> which represents Temporal signal

% Don't change the function signature
f0 = 440;
f = 2^(n/12)*f0;
t = 0:dt:T;
tau = 0.3;
note = @(t) cos(2*pi*f*t).*exp(-3*t/tau);
x = note(t);
end

