%q2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create time vector with 
t_low = -10;
t_high = 10;
number_of_points = 500;

t = linspace(t_low , t_high , number_of_points);

% Choose frequencies
omega_1 = 19; omega_2 = 20;

% Create function vectors with 
f1 = sin(omega_1*t);
f2 = sin(omega_2*t);
f3 = f1 + f2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Single plot
figure;
plot(t,f1,t,f2,t,f3); 
legend('sin(\omega_1t)','sin(\omega_2t)','sin(\omega_1t)+sin(\omega_2t)');
title('Two sine signals and their sum');
xlabel('Time');
ylabel('Magnitude');


% Multiple plots with subplot
figure(2);
subplot(2,2,1);
stem(t,f1); ylim([-2,2]); xlim([-2,2]);  ylim([-2,2]);
legend('sin(\omega_1t)');
title('Stem for sin(omega1*t)');
xlabel('Time');
ylabel('Magnitude');


subplot(2,2,2); 
plot(t,f2,'red','LineWidth',0.1); xlim([-2,2]); ylim([-2,2]);
legend('sin(\omega_2t)');
title("Plot for sin(omega2*t)");
xlabel('Time');
ylabel('Magnitude');

subplot(2,2,3);
plot(t,f3,'*','color','cyan'); 
legend('sin(\omega_1t)+sin(\omega_2t)');
title("Combined signals, drawn with *-s");
xlabel("Time");
ylabel("Magnitude");

subplot(2,2,4);
p = plot(t,f3, 'LineStyle' , ':' , 'color','magenta'); 
p(1).LineWidth = 2;
legend('sin(\omega_1t)+sin(\omega_2t)');
title("Combined signals, drawn with :-s");
xlabel("Time");
ylabel("Magnitude");






