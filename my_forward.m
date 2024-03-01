function [y] = my_forward(L,b)
%my_forward-substitution
n = length(b);
y = zeros(n,1);
for j = 1:n
    if L(j,j) == 0
        break
    else
        y(j) = b(j)/L(j,j);
    end
    for i = j+1:n
        b(i) = b(i) - L(i,j)*y(j);
    end
end