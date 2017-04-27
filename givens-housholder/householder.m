function [ Q, R ] = householder( A0 )

%size of input array A

[m,n] = size(A0);

%working matrix A
A = A0;

%set up identity matrix
I = eye(n);

%Qt keeps track of all the Q's
Qt = eye(n);

%for every column
for i = 1:n
    
    e = I(:,i);
    a = A(:,i);
    a(1:i-1) = 0;
    
    %calculate v
    v = a + sign(a(i))* norm(a) * e;
    
    %calculate Q
    Q = I - 2 * (v * v')/(v' * v);
    
    %sets the first row with the nollställa column
    A = Q * A;
    
    %tracking Q in the iteration
    Qt = Q * Qt;
end

%returning results
Q = Qt'
R = A
A0
Q*R
norm(A0 - Q*R)

%checking against Matlab QR
% [Q0, R0] = qr(A0)
% norm(R0 - R)
% norm(Q0 - Q)
% norm(Q0*R0 - Q*R)

end

