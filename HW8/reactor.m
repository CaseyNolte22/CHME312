%Casey Nolte

%% Trying to Solve Analytically
syms a(t) b(t) c(t) d(t) e(t)

ODEvector = [-5 0 0 0 .01 ; ...
    5 -15 0 0 0 ; ...
    5 0 -.5*3.241 -.5*3.2451 -.01 ; ...
    0 15 -.5*3.241 -.5*3.2451 0 ; ...
    0 0 .5*3.241 .5*3.2451 -.01];

Y = [a; b; c; d; e];

C = Y(0) == [5 0 0 .5 1]';
odes = diff(Y) == ODEvector*Y;

[a b c d e] = dsolve(odes,C);

%% ODE's as functions
[V] = odeToVectorField(odes)
M = matlabFunction(V,'vars', {'t','Y'})

