% FMNN01 Excersize 2 Task 2
%
%   Author
%       Edrick Wong   - 950101P135
%
function [ ] = orthogonality( Q, q )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

a = norm(Q);
b = norm(Q'*Q);
c = eig(Q'*Q);
d = det(Q'*Q);
e = norm(Q) - norm(q);

disp('************************************');

disp('2-norm of Q');
disp(a);

disp('Deviation of Q''Q from I');
disp(1-b);

disp('Eigenvalues of Q''Q'); %Eigenvalues are expected to be 1 or -1
disp(c);

disp('Determinant of Q''Q');
disp(d);

disp('GS vs MatLab QR');
disp(e);


disp('************************************');
end
