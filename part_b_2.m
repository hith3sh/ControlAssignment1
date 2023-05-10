%time ranges from 0 to 4 in higher resolution
t = 0:0.001:4;
%Kp-propotional gain , Ki-integral gain
Ki = 40;Kp = 10;
%reference input signal defined using step function heaviside
r = heaviside(t);

% differential equation that represents the closed-loop control system
eqn = 'D2Y + 11*DY + Ki*Y = Ki';
%initial conditions
inits = 'Y(0) = 0, DY(0) = 0';

%solving the diff equation
Y = dsolve(eqn, inits, 't');
%converts Y into a function that can be evaluated numerically.
Z = eval(vectorize(Y));

plot(t, r, t, Z), grid on;
xlim([0, 2]);
ylim([0, 1.2]);
xlabel('Time (s)');
ylabel('System Response');
title('Closed-loop Control System Response');
legend('Reference input', 'System response');