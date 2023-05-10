% time from 0 to 15 with 0.01 step  
t = 0:0.01:15; 
%voltage vector with zeros
V = zeros(size(t)); 

% Define supply voltage
V(t >= 0 & t < 5) = 1 + t(t >= 0 & t < 5); V(t >= 5 & t < 10) = 5; V(t >= 10 & t < 15) = -t(t >= 10 & t < 15) + 14;

% define power
P = zeros(size(t)); 
P(t >= 0 & t < 5) = (1 + t(t >= 0 & t < 5)) * 10^-4;
P(t >= 5 & t < 10) = 0;
P(t >= 10 & t < 15) = abs(t(t >= 10 & t < 15) - 14) * 10^-4;

figure;

% Plot the voltage subplot
subplot(2,1,1);
plot(t, V, 'k-');
ylabel('Voltage (V)');
title('Supply Voltage & Power');
legend('Supply Voltage');
grid on;

% Plot the power subplot
subplot(2,1,2);
plot(t, P, 'r--');
ylabel('Power (W)');
xlabel('Time(s)');
legend('Power');
grid on;
