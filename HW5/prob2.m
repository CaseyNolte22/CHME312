%Initial Paramters
x1 = .61;
x2 = 1-.61;
y1 = 1.2936;
y2 = 2.0619;

%Wilson Equations set equal to 0
f = @(C)[-log(x1+C(1)*x2)+x2*((C(1)/(x1+C(1)*x2))-(C(2)/(C(2)*x1+x2))) - log(y1) ;...
    -log(C(2)*x1+x2)+x1*((C(1)/(x1+C(1)*x2))-(C(2)/(C(2)*x1+x2))) - log(y2)];

%Partial Derivatives for each with respect to A and B
Df = @(C)[-(1521*C(1))/(10000*((39*C(1))/100 + 61/100)^2),...
    (2379*C(2))/(10000*((61*C(2))/100 + 39/100)^2) - 39/(100*((61*C(2))/100 + 39/100))...
    ; 61/(100*((39*C(1))/100 + 61/100)) - (2379*C(1))/(10000*((39*C(1))/100 + 61/100)^2)...
    , (3721*C(2))/(10000*((61*C(2))/100 + 39/100)^2) - 61/(50*((61*C(2))/100 + 39/100))];

%Solving using Newtons method, 10 iterations with intial guesses of A=B=1
x = [1,1];
for i = 1:10
Dx = -Df(x)\f(x);
x = x + Dx; 
f(x);
end

%Solving using fsolve
fun = @root2d;
x0 = [1,1];
solution = fsolve(fun, x0);

%Display solutions
disp(x(:,1))
disp(solution)