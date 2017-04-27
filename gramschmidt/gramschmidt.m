% FMNN01 Excersize 2 Task 1
%
%   Author
%       Edrick Wong   - 950101P135
%

function [Q, R, q, r] = gramschmidt( A )


[m,n] = size(A);                    %finds the dimensions of A

Q = zeros(m,n);                     %sets up Q matrix with dimensions m by n
R = zeros(n,n);                     %sets up R matrix with dimensions n by n

for j = 1:n                         %for each column of A   
    v = A(:,j);                     %let v be the column j (basis)
    for i=1:j-1
        R(i,j) = Q(:,i)' * A(:,j);  %calculating Rij
        v = v - R(i,j) * Q(:,i);    %subtracting projection
    end
    R(j,j) = norm(v);               %Rjj is the norm
    Q(:,j) = v/R(j,j);              %sets Q to unit basis
end

[q,r] = qr(A);                      %MatLab's QR decomposition
end
