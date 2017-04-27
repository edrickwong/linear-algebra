function [ Q, R, k ] = qr_shift( A )

[m,n] = size(A);

[P,H] = hess(A);

k = 0;
Q = P;
tolerance = 1.e-8;
itmax = 100;

 
for m = n:-1:2
    
   while abs(H(m,m-1)) > tolerance * (abs(H(m,m)) + abs(H(m-1,m-1)))
   
       k = k+1;
       
       if k > itmax
           return
       end
       
       schwifty = H(m,m);
       [Q,R] = qr(H(1:m,1:m) - schwifty*eye(m));
       H(1:m,1:m) = R*Q + schwifty*eye(m);
   end
   H(m,m-1)=0;
end

Q = H;
R = Q\A;
end

