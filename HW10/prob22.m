% Parameters
N = 50; % number of grid points

% Spatial Domain
h = 1/N;
x = h*([1:N]-1)';

% Initial Condition
u = zeros(N,1);
for i = 1:ceil(N/2)
    u(i) = (i/N);
end
for i = ceil(N/2) : N
    u(i) = 1-(i/N);
end
 
% temporal domain
tmax = .4;
a = 20;
k = a*h^2;
M = round(tmax/k);

% Matrix
B = zeros(N,3);
B(:,1) = -a;
B(:,2) = (1+2*a);
B(:,3) = -a;
A = spdiags(B,[-1:1],N,N);
A(1,2) = 0;

% Iterate through time
uSave = [u;0];
tSave = 0;
for j = 1:M
    rhs = u;
    rhs(N) =  0;
    u = A\rhs;
    
    if mod(j,1)==0
        uSave = [uSave, [u;0]];
        tSave = [tSave, j*k];
    end
end

surf(tSave,[x;1],uSave)
xlabel('t','FontSize',14)
ylabel('x','FontSize',14)
zlabel('u(x,y)','FontSize',14)
    