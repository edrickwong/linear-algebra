function [ Q, R ] = given( A0 )

%size of m
[m,n] = size(A0);

A = A0;

%loop for calculations
for j = 1:n
    for i = m:-1:j+1
        %calls rotation to find rotation sinusoids of the two entries
        [c,s] = rotate(A(i-1,j),A(i,j));
        %actual rotation
        A(i-1:i,j:n) = [c s;-s c] * A(i-1:i,j:n);
    end
end
%never found an efficient way to get Q without brute forcing
R = A;
end
