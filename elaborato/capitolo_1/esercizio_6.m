seq_1 = first_sequence( 3 )
seq_2 = second_sequence( 3, 2 )

function [x] = first_sequence( x0 )
    format long e;
    tol = 1e-15;
    x(1,1) = x0;    
    i = 2; % start from x1
    abs_err = x(1,1) - sqrt(3); 

    while(abs_err > tol)
        x(i, 1) = (x(i-1, 1) + 3/x(i-1,1) ) / 2 ;
        abs_err = x(i, 1) - sqrt(3);
        x(i, 2) = abs_err;
        i = i+1;
    end
end 

function [x] = second_sequence( x0, x1 )
    format long e;
    tol = 1e-15;
    x(1,1) = x0;
    x(2,1) = x1;
    i = 3; % start from x2
    abs_err = x(1,1) - sqrt(3); 

    while(abs_err > tol)
        x(i, 1) = ( 3 + x(i-2, 1) * x(i-1, 1) ) / ( x(i-2,1) + x(i-1,1) ) ;
        abs_err = x(i, 1) - sqrt(3);
        x(i, 2) = abs_err;
        i = i+1;
    end
end