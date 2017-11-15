%q5

% Fourier expansion of x(t) = t

t = linspace(-pi,pi,10000);
x = t;
plot(t,x); hold all;

T0 = 2*pi;
N = length(t);
M = 100;
% Start fourier series with l=0, fourier_function is 1
fourier_approx = 1/N*x*exp(0*t)';
fourier_energy = 0;
for i = 1:M
%Calculate 2*M+1 coefficients -M,-(M-1),....-1,0,1,....M-1,M
    fourier_function_p = exp(1j*2*pi/T0*i*t);
    fourier_function_n = exp(-1j*2*pi/T0*i*t);
    fourier_coeff_n = 1/N*x*fourier_function_n';
    fourier_coeff_p = 1/N*x*fourier_function_p';
%Calculate the Fourier series
    fourier_approx = fourier_approx + fourier_coeff_n*fourier_function_n;
    fourier_approx = fourier_approx + fourier_coeff_p*fourier_function_p;
%Calculate the energy
    fourier_energy = fourier_energy + abs(fourier_coeff_n)^2 + ...
        abs(fourier_coeff_p)^2;
end
% plot fourier approx and original function
close all;
figure();
hold all;
plot(t, x, 'b');
plot(t, fourier_approx, 'g');
title("Fourier approx of x=t with " + (2*M+1) + " elements");
xlabel("Time");
ylabel("Magnitude");
legend("original function", "fourier approx");

% calculate diff between original function and fourier approx
% We substitute N-1 = T0/dt, where N is the number of samples
diff = 1/(N-1) * (x - fourier_approx)*(x - fourier_approx)'

% calculate overshoot
[approx_max, approx_max_idx] = max(fourier_approx);
x_at_approx_max = x(approx_max_idx);
diff_overshoot = abs(approx_max - x_at_approx_max);
overshoot = diff_overshoot/abs(x_at_approx_max)

% calculate energy
x_energy = 1/(3*pi) * pi^3
fourier_energy