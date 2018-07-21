A1 = [1,-1,2,2;-1,5,-14,2;2,-14,42,2;2,2,2,65];
A2 = [1,-1,2,2;-1,6,-17,3;2,-17,48,-16;2,3,-16,4];

test(A1)
test(A2)

function [] = test(A)
    A %just print the matrix
    try
        LDL(A);
        disp('la matrice e'' sdp')
    catch
        disp('la matrice NON e'' sdp')
    end
end