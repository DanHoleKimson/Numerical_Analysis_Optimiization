function [L,U] = my_bandLU(A, m, n, bandWidth)
%my_bandLU
L = eye(m,n);
U = zeros(m,n);

for k = 1:m
    for j = k:min(k + bandWidth,n)
        U(k,j) = A(k,j);
        for p = max(k - bandWidth,1):k-1
            U(k,j) = U(k,j) - L(k,p) * U(p,j);
        end
    end

    for i = k+1:min(k+bandWidth, m)
        L(i,k) = A(i,k);
        for p = max(k - bandWidth,1):k-1
            L(i,k)=L(i,k)-L(i,p)*U(p,k);
        end
        L(i,k) = L(i,k)/U(k,k);
    end
end
end