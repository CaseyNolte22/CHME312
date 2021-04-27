%% Parameters
N = 100; % number of grid points

%% Spatial Domain
h = 1/N; % distance between grid points
r = [0:h:1]'; % location of grid point

%% Sparse Matrix
A = spalloc(N,N,3*N);  % allocate sparse matrix
% Equation for i = 1 (r = 0)
A(1,1) = -2/h^2 -.1;
A(1,2) = 1/h^2;
% Equations for i = 2...N-1
for i = 2:N-1
    A(i,i-1) = 1/h^2;
    A(i,i) = -2/h^2 - .1;
    A(i,i+1) = 1/h^2;
end
% Equations for i = N
A(N,N-1) = 1/h^2;
A(N,N) = -2/h^2 - .1;

%% Right Hand Side
b = zeros(N,1);
b(1) = -200/h^2
b(N) = -100/h^2;

%% Solve Linear System
c = A\b;
c = [c;100]; % append the value at r = 1

%% Plot Result
plot(r,c,'- .');
title('Temperature Profile')
xlabel('X0 to X1')
ylabel('T')