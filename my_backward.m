function [x] = my_backward(U,b)
%my_backward-substitutioin
n = length(b);
x = zeros(n,1);
for j = n:-1:1
    if U(j,j) == 0
        break
    else
        x(j) = b(j)/U(j,j);
    end
    for i = 1:j-1
        b(i) = b(i) - U(i,j)*x(j);
    end
end
end