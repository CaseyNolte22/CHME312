function [B] = GaussJordan(A)
%% GaussJordan.m
% Function performs Gauss-Jordan elimination to invert matrix A
%
% Kyle Bishop, 1/21/2013
%
% INPUT:
%  A - square NxN matrix
%
% OUTPUT:
%  B - inverse of matrix A

%% Check the dimensions of the input 
N = size(A,1); % number of rows in matrix A
M = size(A,2); % number of columns in matrix A
if N ~= M % matrix is not square
    error('Input matrix A is not square.');
    return;
end

%% Perform elementary row operations to put A in upper triangular form
B = eye(N); % initialize B to identity matrix
for i = 1:N-1 % iterate over columns from left to right
    % Partial Pivoting
    [val,j] = max(abs(A(i:N,i))); % find maximum element in column i below the diagonal
    if val < 1e-10
        error('Matrix is singular to working precision.');
        return;
    end
    if j ~= i % interchange rows i and j
        temp = A(i,:); % store row i in a temporary variable temp
        A(i,:) = A(j,:); 
        A(j,:) = temp;
        temp = B(i,:);
        B(i,:) = B(j,:);
        B(j,:) = temp;
    end
    
    % Elementary Row Operations
    for j = i+1:N % iterate over rows below diagonal
        lambda = A(j,i) / A(i,i);
        A(j,i:N) = A(j,i:N) - lambda*A(i,i:N);
        B(j,:) = B(j,:) - lambda*B(i,:);
    end
end

%% Perform more elementary row operations to get A into diagonal form
for i = N:-1:2 % iterate over columns from right to left
    % Elementary Row Operations
    for j = i-1:-1:1 % iterate over rows above diagonal
        lambda = A(j,i) / A(i,i);
        A(j,i:N) = A(j,i:N) - lambda*A(i,i:N);
        B(j,:) = B(j,:) - lambda*B(i,:);
    end
end

%% Normalize diagonal elements of A to 1
for j = 1:N  % iterate across all rows 
    B(j,:) = B(j,:)/A(j,j);
    A(j,j) = 1;
end
