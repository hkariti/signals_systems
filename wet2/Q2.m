%% Q2
close all;
clear;

%% Code here: ...
Sinc = @(t) sinc(t / pi);
dt = 2^(-13);
T_h = 0.5;
T_b = 0.25;
mary_notes = [ -5 -7 -9 -7 -5 -5 -5 -7 -7 -7 -5 -5 -5 ...
    -5 -7 -9 -7 -5 -5 -5 -9  -7 -7 -5 -7 -9 ];
mary_times = [ T_b T_b T_b T_b T_b T_b T_h ...
    T_b T_b T_h T_b T_b T_h T_b T_b T_b T_b T_b T_b T_b T_b ...
    T_b T_b T_b T_b T_h ];
s = makeTune(mary_notes, mary_times, dt);

Fs = 1/dt; % Sampling frequency
spectrogram(s, T_b * Fs + 1 , 0 , Fs * T_b , Fs , 'yaxis'); ylim([0,0.6]);

load noise.mat;
s_noisy = s(:) + noise(:);

T_total = sum(mary_times); % Total time
t = linspace(0,T_total,length(s));
f = -1000 : 1000;
S = fourierTransform(s, 2*pi * f, t);
S_noisy = fourierTransform(s_noisy, 2*pi*f, t);

% Plot original and noisy signals
figure;
subplot(3, 1, 1);
hold all;
plot(f, abs(S_noisy), 'b');
xlabel('f [Hz]');
ylabel('ampl.');
plot(f , abs(S) , 'r:' , 'linewidth', 1);
legend( 'S_{noisy}(f)' , 'S_{clean} (f)' );
title("Top graph");

% Set up our bandpass filter, band is 200Hz-540Hz, positive and negative
T = 2;
t = -T:dt:T;
f = -1000:1000;

LF = 200;
HF = 500;
F2 = (LF+HF)/2;
width = (HF-LF)/2;
h = (exp(j*2*pi*F2*t)+exp(-j*2*pi*F2*t)) * 2*width.*Sinc(2*pi*width*t);
H = fourierTransform(h, 2*pi*f, t);
% Plot the frequency response for our filter
subplot(3, 1, 2);
hold all;
plot(f, abs(H), 'b');
xlabel('f [Hz]');
ylabel('ampl.');
legend( 'H(f)');
title("Middle graph");

% Filter signal and plot it's Fourier transform
s_trimmed = s(1:length(t)); % Trim signal so it'll fit in our sample size
s_noise_filtered = conv(s_trimmed,h,'same') * dt;
S_NF = fourierTransform(s_noise_filtered, 2*pi*f, t);
subplot(3, 1, 3);
hold all;
plot(f, abs(S_NF), 'b');
xlabel('f [Hz]');
ylabel('ampl.');
legend( 'F\{sNoiseFiltered(t)\}');
title("Bottom graph");

%% For automatic tests, do not change the structure of 'answers',
% Only enter the following variables to the answers structure (fill the '?'):
answers = struct();
answers.s 		 		 = s;
answers.ht 				 = h ;
answers.s_noise_filtered = y ;


