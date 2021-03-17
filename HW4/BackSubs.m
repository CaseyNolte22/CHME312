%% BackSubs.m
% Function performs back substitution on input matrix A and vector b
%
% Kyle Bishop, 12/27/2012
%
% INPUT:
%  A - square NxN matrix in upper triangular form
%  b - Nx1 column vector
%
% OUTPUT:
%  x - solution to the linear system, Ax = b

function x = BackSubs(A,b)

%% Check the dimensions of the input 
N = size(A,1); % number of rows in matrix A
M = size(A,2); % number of columns in matrix A
if N ~= M % matrix is not square
    error('Input matrix A is not square.');
    return;
end
if size(b) ~= [N,1]
    error('Size of input vector b is inconsistent with matrix A.');
    return;
end

%% Check that matrix A is upper triangular
for i = 1:N
    for j = 1:i-1
        if abs(A(i,j)) > 1e-10 % A(i,j) = zero to machine precision
            error ('Input matrix A is not upper triangular.');
            return
        end
    end
end

%% Perform Back Substitution
x = zeros(N,1); % (optional) preallocate vector x
for i = N:-1:1 % iterate over rows from bottom to top
    sum = 0;
    for j = i+1:N % iterate over lower columns
        sum = sum + A(i,j)*x(j);
    end
    x(i) = (b(i) - sum)/A(i,i);
end