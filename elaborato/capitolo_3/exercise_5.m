matrix_size = zeros(10, 1);
matrix_cond = zeros(10, 1);

lu_e = zeros(10, 1);
lu_r_b = zeros(10, 1);

ldl_e = zeros(10, 1);
ldl_r_b = zeros(10, 1);

for n=1 : 10
    step = 50;
    
    A = randi(n*step, n*step);      %pseudorandom matrix of n x n
    A = A*A';                       %symmetric matrix
    x_ = randi(1000, n*step, 1);    %pseudorandom vector of n elements
    b = A*x_;

    lu_x  = solve_with_lu_pivoting( A, b );
    ldl_x = solve_with_ldl( A, b );
    
    matrix_size(n) = n*step; 
    matrix_cond(n) = cond(A)*cond(inv(A));
    
    lu_e(n) = norm(lu_x - x_)/norm(x_);
    lu_r_b(n) = norm(A*lu_x - b)/norm(b);
    
    ldl_e(n) = norm(ldl_x - x_)/norm(x_);
    ldl_r_b(n) = norm(A*ldl_x - b)/norm(b);
end

table( matrix_size, matrix_cond, lu_e, lu_r_b, ldl_e, ldl_r_b )