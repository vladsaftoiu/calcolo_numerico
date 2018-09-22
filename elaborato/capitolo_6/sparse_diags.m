function [ A ] = sparse_diags( n )
%[ A ] = SPARSE_DIAGS( n )
% builds a sparse matrix of size n with -4 as diagonal then -1 as
% subdiagonals placed at distances of 1, 10 from d

    B = [ zeros(n,1)-1 zeros(n,1)-1 zeros(n,1)+4 zeros(n,1)-1 zeros(n,1)-1 ];
    d = [ -10 -1 0 1 10 ]';
    
    A = full( spdiags( B, d, n, n ) );
end