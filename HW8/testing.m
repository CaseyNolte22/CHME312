%Casey Nolte

%% Trying to Solve Analytically
syms a(t) b(t) c(t) d(t) e(t)
ode1 = diff(a,t) == -5*a + .01*e;
ode2 = diff(b,t) == 5*a - 15*b;
ode3 = diff(c,t) == 5*a - .5*c*d;
ode4 = diff(d,t) == 15*b -.5*c*d;
ode5 = diff(e,t) == .5*c*d - .01*e;

odes = [ode1; ode2; ode3; ode4; ode5;];

conds = [a(0) == 5; b(0) == 0; c(0) == 0; d(0) == .5; e(0) == 1];

[a b c d e] = dsolve(odes, conds);

%% Eulers
h = .14;
tmax = 100;       % maximum time
t = 0:h:tmax;   % time points
c = zeros(length(t),5);
c(1,:) = [5,0,0,.5,1]; % Initial condition
for n = 1:length(t)-1
    F = h*diff_eqs(t(n),c(n,:)); 
    c(n+1,:) = c(n,:) + F';
end
figure('Name','Eulers')
plot(t,c)
legend('Ca','Cb','Cc','Cd','Ce')
xlabel('Time')
ylabel('Concentration(M)')

%% RK-2                
h=0.05;                   
t = 0:h:5;               
c = zeros(length(t),5);
c(1,:) = [5,0,0,.5,1]; % Initial condition
for n=1:(length(t)-1)
    K1 = h*diff_eqs(t(n),c(n,:));    
    K2 = h*diff_eqs(t(n)+.5*h,c(n,:)+.5*h*K1');    
    c(n+1,:) = c(n,:) + K2';
end
figure('Name','RK-2')
plot(t,c)

hold on
%% RK-4
h=0.05;                   
t = 0:h:5;               
c = zeros(length(t),5);
c(1,:) = [5,0,0,.5,1]; % Initial condition
for n=1:(length(t)-1)
    K1 = h*diff_eqs(t(n),c(n,:));    
    K2 = h*diff_eqs(t(n) + .5*h,c(n,:)+.5*K1');
    K3 = h*diff_eqs(t(n) + .5*h,c(n,:)+.5*K2');
    K4 = h*diff_eqs(t(n) + h,c(n,:)+ K3');
    c(n+1,:) = c(n,:) + K1'/6 + K2'/3 + K3'/3 + K4'/6;
end
plot(t,c)


%% ODE45
x0 = [5;0;0;.5;1];
[t,y] = ode45(@diff_eqs,[0 5],x0);
plot(t,y)
xlabel('Time')
ylabel('Concentration(M)')
%% ode15s
x0 = [5;0;0;.5;1];
[t,y] = ode15s(@diff_eqs,[0 5],x0);
plot(t,y)





