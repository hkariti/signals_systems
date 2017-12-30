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
x_inv = real(invFourierTransform(X, w, t));

W = 15;
y = W/pi * Sinc(W*t);
Y = fourierTransform(y, w, t);
y_inv = real(invFourierTransform(Y, w, t));
% GRAPH
figure;
subplot(3,1,1);
hold all;
xlabel('Time[sec]'); ylabel('amplitude');
plot(t, x, '-b');
plot(t,x_inv, '--r');
legend("x(t)","x(t) from inverse fourier");
title("Top Graph");
subplot(3,1,2);
hold all;
plot(w, abs(X));
plot(w, abs(Y));
legend("foureir of x(t)", "fourier of y(t)");
xlabel('Freq[rad/sec]');
ylabel('amplitude');
title("Middle graph");
subplot(3,1,3);
hold all;
plot(t, y);
legend("y(t)");
xlabel('Time[sec]');
ylabel('amplitude');
title("Bottom graph)");

%% For automatic tests, do not change the structure of 'answers',
% Only enter the following variables to the answers structure (fill the '?'):
answers = struct();
answers.x =  % ? ;
answers.y =  % ? ;
answers.z =  % ? ;

