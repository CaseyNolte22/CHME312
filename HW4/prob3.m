%Casey Nolte
%CHME 312, March 6th, 2021

% Parameters
N = 50;
B = .9;
G = 100;
L = 120;

% Domain
x = 1:N;

%Generating Matrix
A = zeros(N:N);
for i = 1:50
        A(i,i) = B*G+L;
end
for i = 1:49
        A(i,i+1) = -L;
        A(i+1,i) = -B*G;
end

%Generating b vector
d = zeros(N,1);
d(1) = .5*G;
d(N) =  .0001*L;

%Printing for part a
disp(A(1:7,1:7));
disp(d);

%Solving using Gauss-Jordan
Ainv = inv(A);
Solved = Ainv*d;

% Plot
hold on;
plot(x,Solved,'o');
plot(x, Solved/B, 'o');
xlabel('{\itTray}','FontSize',14);
ylabel('{\ity, x}','FontSize',14);
legend('y','x')
hold off;

% Setting up system from tridiagonal solver
a = (-B*G)*ones(N,1);
b = (B*G+L)*ones(N,1);
c = (L)*ones(N,1);

% Solve with tridiagonal solver
v = tridiag(a,b,c,d);

%Plot
%plot(x,v,'o');
xlabel('{\itTray}','FontSize',14);
ylabel('{\ity}','FontSize',14);




