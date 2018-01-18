%% Init
load EcgData.mat;
N = length(vEcgSig);

%% Q1 - Plot original signal
figure();
plot(vFreqAxis, vEcgSig);
xlabel("Time")
ylabel("Amplitude")
title("ECG Signal")

%% Q2a - Calculate Fourier transform of singal and plot
vEcgSigF = fftshift( (fft(vEcgSig))) / sqrt(N);

figure();
plot(vFreqAxis, abs(vEcgSigF));
xlabel("Angular Frequency")
ylabel("Amplitude")
title("Fourier of ECG Signal")
%% Q2b - Filter DC value
x_mean = mean(vEcgSig);
vEcgSig2 = vEcgSig - x_mean;
vEcgSigF2 = fftshift( (fft(vEcgSig2))) / sqrt(N);

figure;
plot(vFreqAxis, abs(vEcgSigF2));
xlabel("Angular Frequency")
ylabel("Amplitude")
title("Fourier of ECG Signal minus the mean")

%% Q3 - Plot a limited region of the signal
figure; plot(vFreqAxis, abs(vEcgSigF)); axis([60,100,0,1.5])

%% Q4 - Filter signal
epsilon = 0.2;
signalF = fftshift((fft(vEcgSig2))) / sqrt(N);
signalF(abs(signalF) < epsilon) = 0;
vY = ifft(ifftshift(signalF))*sqrt(N);
%% Q5 - Plot filtered and original signal
figure;
ax(1) = subplot(2,1,1); plot(vTimeAxis, vEcgSig, 'b', 'LineWidth', 2);
ax(2) = subplot(2,1,2); plot(vTimeAxis, vY, 'r', 'LineWidth', 2);
linkaxes(ax, 'x');
title(ax(1), "Original ECG Signal");
xlabel(ax(1), "Time");
ylabel(ax(1), "Amplitude");
title(ax(2), "Filtered ECG Signal");
xlabel(ax(2), "Time");
ylabel(ax(2), "Amplitude");
%%
end
