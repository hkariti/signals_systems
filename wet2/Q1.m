%% Q1
close all;
clear;

%% Code here: ...
Sinc = @(t) sinc(t / pi);
% Make time series
T = 2;
dt = 0.005;
t = (-T:dt:T)';
% Delete last entry.
t(end) = [ ];
% Make freq domain
W0 = pi/dt;
dw = pi/T;
w = (-W0:dw:W0)';

x = sin(3*pi*t) + 3*cos(9*pi*t);
X = fourierTransform(x, w, t);
x_inv = invFourierTransform(X, w, t);

W = 15;
y = W/pi * Sinc(W*t);
Y = fourierTransform(y, w, t);
y_inv = invFourierTransform(Y, w, t);

z = Conv(x, y, w, t);
Z = fourierTransform(z, w, t);
% GRAPH
figure;
subplot(3,1,1);
hold all;
xlabel('Time[sec]'); ylabel('amplitude');
plot(t, x, '-b');
plot(t,x_inv, '--r');
plot(t, z, '-k');
legend("x(t)","x(t) from inverse fourier", "z(t)");
title("Top Graph");
subplot(3,1,2);
hold all;
plot(w, abs(X));
plot(w, abs(Y));
plot(w, abs(Z));
legend("foureir of x(t)", "fourier of y(t)", "fourier of z(t)");
xlabel('Freq[rad/sec]');
ylabel('amplitude');
xlim([-100, 100]);
title("Middle graph");
subplot(3,1,3);
hold all;
plot(t, y, '-b');
plot(t, y_inv, '--r');
legend("y(t)", "y(t) from inverse fourier");
xlabel('Time[sec]');
ylabel('amplitude');
title("Bottom graph)");

%% For automatic tests, do not change the structure of 'answers',
% Only enter the following variables to the answers structure (fill the '?'):
answers = struct();
answers.x =  x;
answers.y =  y;
answers.z =  z;

