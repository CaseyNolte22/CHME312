fun = @(x) 2*x(1)^3+6*x(1)*x(2)^2-3*x(2)^3-150*x(1);
x0 = [3,4];
fminsearch(fun,x0)
fmaxsearch(fun,x0)