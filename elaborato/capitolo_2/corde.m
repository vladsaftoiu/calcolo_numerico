function [ x1, evals ] = corde( x0, f, f1, tolx, itmax )
       
    f1x0 = feval( f1, x0 );
    i = 0;
    proceed = true;
    
    while proceed && ( i < itmax )
        i = i+1;
        fx = feval( f, x0);
        
        if (f1x0 == 0)
            proceed = false; 
            i = i-1;
            break;
        end
        x1 = x0 - fx/f1x0;
        
        proceed = abs( x1 - x0 ) > tolx;
        x0 = x1;
    end
    
    evals = i + 1;
    
    if (proceed), disp('il metodo non converge'), end
end