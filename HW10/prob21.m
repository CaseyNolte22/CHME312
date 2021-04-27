%% spatial domain
N = 50;             % number of grid points
h = 1/N;            % grid spacing
x = h*([1:N]'-1);    % grid points

%% time domain
tmax = .4;           % maximum time
a = .4;              % k / h^2
k = a*h^2;          % time step
M = ceil(tmax/k);   % number of temporal iterations

%% Initial Condition
u = zeros(N,1);
for i = 1:ceil(N/2)
    u(i) = (i/N);
end
for i = ceil(N/2) : N
    u(i) = 1-(i/N);
end

%% Sparse matrices 
B = zeros(N,3);
B(:,1) = -a/2;
B(:,2) = (1+a);
B(:,3) = -a/2;
Alhs = spdiags(B,[-1:1],N,N);
Alhs(1,2) = 0;

B = zeros(N,3);
B(:,1) = a/2;
B(:,2) = (1-a);
B(:,3) = a/2;
Arhs = spdiags(B,[-1:1],N,N);
Arhs(1,2) = 0;

%% Iterations
uSave = [u;0];
tSave = 0;
for j = 1:M
    rhs = Arhs*u;
    rhs(end) = 0;
    u = Alhs\rhs;
    
    % Save the solution at 100 intermediate points
    if mod(j,M/100) == 0 
        uSave = [uSave, [u;0]];
        tSave = [tSave, j*k];
    end
end

surf(tSave,[x;1],uSave)
xlabel('t','FontSize',14)
ylabel('x','FontSize',14)
zlabel('u(x,y)','FontSize',14)