%q5

% Fourier expansion of x(t) = t

t = linspace(-pi,pi,10000);
x = t;
plot(t,x); hold all;

T0 = 2*pi;
N = length(t);
M = 200
% Start fourier series with l=0, fourier_function is 1
fourier_approx = 1/N*x*exp(0*t)';
for i = 1:M
%Calculate 2*M+1 coefficients -M,-(M-1),....-1,0,1,....M-1,M
    fourier_function_p = exp(1j*2*pi/T0*i*t);
    fourier_function_n = exp(-1j*2*pi/T0*i*t);
    fourier_coeff_n = 1/N*x*fourier_function_n';
    fourier_coeff_p = 1/N*x*fourier_function_p';
%Calculate the Fourier series
    fourier_approx = fourier_approx + fourier_coeff_n*fourier_function_n;
    fourier_approx = fourier_approx + fourier_coeff_p*fourier_function_p;
end
% plot fourier approx and original function
close all;
figure();
hold all;
plot(t, x, 'b');
plot(t, fourier_approx, 'g');
legend("original function", "fo urier approx");

% calculate diff between original function and fourier approx
diff = 1/N * (x - fourier_approx)*(x - fourier_approx)'
