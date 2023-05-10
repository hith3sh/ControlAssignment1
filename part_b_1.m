%creates a new figure window with the number 1
figure(1);
hold on; 
%enables the grid lines on the plot
grid on;

for kp= 0:5:20
    %creates a transfer function M
   M = tf(kp,[1 kp+1]); 
 %plots the step response of the M using the step function
   plot(step(M),'DisplayName', ['kp = ' num2str(kp)]);
end

hold off;
legend('Location','best');