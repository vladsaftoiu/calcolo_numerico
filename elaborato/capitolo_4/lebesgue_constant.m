function [ leb_constant ] = lebesgue_costant ( xs )
    
    rows = length(xs);
    
    V_pts = gallery('chebvand' , rows , xs );
    M = max( 5000, 10 * rows );
    pts_leb = linspace( -1 ,1 , M ) ; % PUNTI TEST.
    V_leb = gallery( 'chebvand' , rows , pts_leb );
    leb_constant = norm( V_pts\V_leb , 1 ) ;
end
