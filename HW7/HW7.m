%% Analytical Solution
asol = @(x) 20 - 10*exp(-2.5*x); 
fplot(asol, [0,2.5])
xlabel('Time')
ylabel('T')
legend('Eulers Method, step size = .1')
hold on


%% Eulers method
N0 = 10; % initial condition
k = 2.5;  % constant
%Domain
tmax = 2.5;    % maximum time
h =.1;      % step size
t = 0:h:tmax; % time points
% Allocate population vector
N = zeros(size(t));
% Euler's Method
N(1) = N0; % Initial condition
for n = 1:length(N)-1    
    N(n+1) = N(n) + h*k*(20-N(n));
end
% Plot Euler
plot(t,N,'-');
xlabel('Time')
ylabel('T')
legend('Eulers Method, step size = .1')


%% ODE45
tspan = [0,2.5];
y0 = 10;
[t,y] = ode45(@(t,y) k*(20-y), tspan, y0);
plot(t,y,'-')
xlabel('Time')
ylabel('T')
legend('ODE45')

%% Second Order Rung-Kutta
y0 = 10;                  
h=0.1;                   
t = 0:h:2.5;               
N = zeros(size(t));  
N(1) = y0;           
for i=1:(length(t)-1)
  k1 = 2.5*(20-N(i));             
  y1 = N(i)+k1*h/2;    
  k2 = 2.5*(20-y1);                 
  N(i+1) = N(i) + k2*h; 
end
plot(t,N);
xlabel('Time')
ylabel('T')
legend('Analytical Solution', 'Eulers Method', ' ODE45','2nd Order Runge-Kutta')




