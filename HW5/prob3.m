f = @Prob3Function;

Df =@(x) ...
[-1,  0,  0, -100000*x(4),          0,           0,          0,           0,           0;...
  1, -1,  0,           0, -100000*x(5),          0,          0,           0,           0;...
  1,  0, -1,           0,           0, -100000*x(6),         0,           0,           0;...
  0,  1, -1,           0,           0,           0, -50000*x(7),          0,           0;...
  0,  1,  0,           0,           0,           0,          0, -100000*x(8),          0;...
  0,  0,  1,           0,           0,           0,          0,           0, -100000*x(9);...
  0,  0,  0,        1/25,      -1/100,      -1/100,          0,           0,           0;...
  0,  0,  0,           0,       1/100,           0,      -1/25,      -1/100,           0;...
  0,  0,  0,           0,           0,       1/100,       1/25,           0,      -1/100];

%Solve using newtons method
x = [100,100,100,1,1,1,1,1,1];
for i = 1:20
    Dx = -Df(x)\(f(x)');
    x = x + Dx; 
end

%Display Solution
disp(x(:,1))

%Solving using fsolve
x0 = [1,1,1,1,1,1,1,1,1];
solution = fsolve(f, x0)


