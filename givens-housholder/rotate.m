function [ c, s ] = rotate( x1, x2 )

if x2 == 0
    c = 1;
    s = 0;
else
    if abs(x2) >= abs(x1)
        cot = x1/x2;
        s = 1/sqrt(1+cot^2);
        c = s * cot;
    else
        tan = x2/x1;
        c = 1/sqrt(1+tan^2);
        s = c * tan;
    end
end

