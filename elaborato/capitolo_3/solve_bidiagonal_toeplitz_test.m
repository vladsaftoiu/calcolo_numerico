clear;

size = 15;
alpha = 11;

A = diag(linspace(alpha,alpha,size-1),-1) + eye(size);
b = A*randi(1000, size, 1);

x_ = solve_bidiagonal_toeplitz( alpha, b );
x  = A\b;

disp('solve( alpha, b ) vs A\b diff is:');
norm(x-x_)
