%q4

%% Part 1
% Make new vector t1 using linespace
t1 = linspace(-pi, pi, 100);
% Make new vector t2 using syntax -
%       t = t_first : del_t : t_last
dt = 2*pi/100;
t2 = -pi:dt:pi;
%Compare them. Are they the identical?

%% Part 2
t = -pi:2*pi/9999:pi;
% Make two sine-waves
f1 = sin(1*t);
f2 = sin(10.1*t);
% Plot them and explain the results
close all;
figure();
title("sin(1t) and sin(10.1t) between -pi and +pi");
xlabel("Time");
ylabel("Magnitude");
hold();
plot(t, f1, 'b');
plot(t, f2, 'g');

%% Part 3

% Inner product of two sine-waves
% calculate f1 and f2 for t1 (100 samples)
f1_100 = sin(1*t1);
f2_100 = sin(10.1*t1);
% Calculate both inner product. We substitute delta_T/T0 = 1/N
inner_product_100 = f1_100*f2_100' * 1/100;
inner_product_10000 = f1*f2' * 1/10000;