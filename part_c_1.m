% time from 0 to 15 with step size of 0.01
t = 0:0.01:15; 
%voltage vector v with zeros
v = zeros(size(t)); 

%set the values of v equal to the corresponding values of t for the time range t <= 5.
v(t <= 5) = t(t <= 5); 
% set the values of v to 5 for the time range 5 < t <= 10.
v(t > 5 & t <= 10) = 5; 
% set the values of v to a linearly decreasing ramp from 15 to 10 for the time range 10 < t <= 15.
v(t > 10 & t <= 15) = (-t(t > 10 & t <= 15) + 10) + 5;

% Define transfer function parameters 
Kp = 10; Ki = 40;
Num = [Kp Ki]; Den = [1 Kp+1 Ki];
M = tf(Num,Den);

%applying v to the tf M using the lsim function & stores the output response in the vector y
y = lsim(M, v, t);

% Plot Reference
plot(t, v, 'r--', t, y, 'b-');
xlabel('Time (s)');  ylabel('Voltage(V)');
legend('Reference Vol','Actual Vol');  title('Reference Voltage and Actual Voltage')
xlim([0,16]); ylim([0, 6]);
grid on