function [ A ] = sparse_diags( n )
    
    B = [ zeros(n,1)-1 zeros(n,1)-4 zeros(n,1)-1 ];
    d = [ -10 0 10 ]';
    
    A = full( spdiags( B, d, n,n ) );
    
end