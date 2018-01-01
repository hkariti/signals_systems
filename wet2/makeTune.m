function s = makeTune(n, T, dt)
%MAKETUNE creates a digital signal that represents a tune.

% Iputs: T - Duration
%        fs - Note frequency
%        n - Note (integer value)

% Output: x - signal

% Don't change the function signature

s = zeros(1, ceil(sum(T)/dt));
start_index = 1;
for i = 1:length(n)
    end_index = start_index + ceil(T(i)/dt);
    note = makeNote(n(i), T(i), dt);
    s(start_index:end_index) = note;
    start_index = end_index + 1;
end

