%% GaussElimPivot.m
% Function performs Gaussian elimination on input matrix A and vector b
%
% Kyle Bishop, 12/27/2012
%
% INPUT:
%  A - square NxN matrix
%  b - Nx1 column vector
%
% OUTPUT:
%  A - transformed matrix in upper triangular form
%  b - transformed vector 

function [A,b] = GaussElimPivot(A,b)

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

%% Perform elementary row operations
for i = 1:N-1 % iterate over columns from left to right
    % Partial Pivoting
    j = i;
    for k = i:N % Find maximum element in column i (below diagonal)
        if abs(A(k,i)) > abs(A(j,i))
            j = k;
        end
    end
    if A(j,i) == 0
        error('No unique solution!');
        return;
    end
    if j ~= i % interchange rows i and j
        temp = A(i,:); % store row i in a temporary variable temp
        A(i,:) = A(j,:); 
        A(j,:) = temp;
        temp = b(i);
        b(i) = b(j);
        b(j) = temp;
    end
    
    % Elementary Row Operations
    for j = i+1:N % iterate over rows below diagonal
        lambda = A(j,i) / A(i,i);
        for k = i:N % iterate in row j from column # i to right
            A(j,k) = A(j,k) - lambda*A(i,k);
        end
        b(j) = b(j) - lambda*b(i);
    end
end