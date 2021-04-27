function [error,r,y] = EvaluateGuess(cGuess)

TINY = 1e-10; 
rspan = [TINY,1];  % domain
x0 = [cGuess,0];   % solution at x = 0 
options = odeset('RelTol',1e-6);  % integration options

% Integrate
[r,y] = ode45(@MyFunc,rspan,x0,options);

% Calculate Error
cCalc = y(end,1);
cExact = 100;
error = cCalc - cExact;

%--------------------------------------------------------------------------
function dTdx = MyFunc(x,T)
dTdx = zeros(2,1);
dTdx(1) = T(2);
dTdx(2) = .1*T(1);