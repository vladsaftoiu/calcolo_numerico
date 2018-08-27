clear;
format long;

A = [ 10^-13, 1; 1,1 ];  
e = [1,1]';
b = A*e;

lu_= LU(A);
L = tril(lu_, -1) + eye(2)
U = triu(lu_)

U\(L\b) %gauss no pivoting
A\b     %gauss pivoting
