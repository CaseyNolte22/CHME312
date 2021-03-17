function [x] = tridiag(a,b,c,d)

% Check the dimensions of the input 
N = length(a);

%Gaussian Elimination
for i = 2:N     
    lambda = a(i)./b(i-1);    
    b(i) = b(i) - lambda.*c(i-1);     
    d(i) = d(i) - lambda.*d(i-1); 
end

%Back Substitution
x = zeros(N,1);
x(N) = d(N) / b(N);
for i = N-1:-1:1
    x(i) = (d(i) - c(i)*x(i+1)) / b(i);
end
end

