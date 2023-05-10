% defining time & voltage
t = 0:0.01:15; 
ref = zeros(size(t)); 

% Defining supply voltage
for n = 1:length(t)
    if t(n) <= 5
        %reference voltage is set to the value of t(n)
        ref(n) = t(n);
    elseif t(n) > 5 && t(n) <= 10
        %reference voltage is set to a constant value of 5.
        ref(n) = 5;
    elseif t(n) > 10
        %reference voltage is set to the value of 15 - t(n)
        ref(n) = 15 - t(n);
    end
end
%differential equation
eqn = '0.88 *Dx + x = ref';
%initial condition
inits = 'x(0) = 0';
x = dsolve(eqn,inits,'t');
z= eval(vectorize(x));

%plotting 
plot(t,z,'r-',t,ref,'b--');
legend('Open loop Actual','Reference')
title(' Open loop Actual Voltage VS Reference Voltage')
xlim([0 16])
ylim([0 6])
grid on