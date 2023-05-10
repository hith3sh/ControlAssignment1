% Code snippet 1: Multiple step response plots
figure(1);
hold on;
grid on;
for kp = 0:5:20
    M = tf(kp, [1 kp+1]);
    plot(step(M), 'DisplayName', ['kp = ' num2str(kp)]);
end
hold off;
legend('Location', 'best');

% Code snippet 2: Closed-loop control system response
t = 0:0.001:4;
Ki = 40;
Kp = 10;
r = heaviside(t);
eqn = 'D2Y + 11*DY + Ki*Y = Ki';
inits = 'Y(0) = 0, DY(0) = 0';
Y = dsolve(eqn, inits, 't');
Z = eval(vectorize(Y));
figure(2);
plot(t, r, t, Z);
grid on;
xlim([0, 2]);
ylim([0, 1.2]);
xlabel('Time (s)');
ylabel('System Response');
title('Closed-loop Control System Response');
legend('Reference input', 'System response');

% Code snippet 3: Voltage and power plot
t = 0:0.01:15;
V = zeros(size(t));
V(t >= 0 & t < 5) = 1 + t(t >= 0 & t < 5);
V(t >= 5 & t < 10) = 5;
V(t >= 10 & t < 15) = -t(t >= 10 & t < 15) + 14;
P = zeros(size(t));
P(t >= 0 & t < 5) = (1 + t(t >= 0 & t < 5)) * 10^-4;
P(t >= 5 & t < 10) = 0;
P(t >= 10 & t < 15) = abs(t(t >= 10 & t < 15) - 14) * 10^-4;
figure(3);
subplot(2,1,1);
plot(t, V, 'k-');
ylabel('Voltage (V)');
title('Supply Voltage & Power');
legend('Supply Voltage');
grid on;
subplot(2,1,2);
plot(t, P, 'r--');
ylabel('Power (W)');
xlabel('Time (s)');
legend('Power');
grid on;

% Code snippet 4: Open-loop actual voltage vs. reference voltage plot
t = 0:0.01:15;
ref = zeros(size(t));
for n = 1:length(t)
    if t(n) <= 5
        ref(n) = t(n);
    elseif t(n) > 5 && t(n) <= 10
        ref(n) = 5;
    elseif t(n) > 10
        ref(n) = 15 - t(n);
    end
end
eqn = '0.88 *Dx
