clearvars
close all
clc
% define band-matrix A
n = 100;
e = ones(n,1);
A = spdiags([e -4*e 6*e -4*e e],-2:2,n,n);
full(A);
A(1,1) = 9;
A(99,99) = 5;
A(100,99) = -2;
A(99,100) = -2;
A(100,100) = 1;
%define matrix b
b = ones(n,1);

%use LU factorization to solve Ax = b
[m,n] = size(A);
[L,U] = my_bandLU(A,m,n,5);
Y = my_forward(L,b);
X = my_backward(U,Y);

%display ans
disp(X);

%개인적으로 matlab에서 함수를 정의할 때, 함수들은 따로 빼서 만드는걸 선호하는 편입니다
%함수들을 다 빼서 구현하였고 그 파일들도 다 첨부할 예정이지만 과제에서 function을 m-file에 한 번에 넣으라고 이해해서
%첨부합니다.


function [x] = my_backward_example(U,b)
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

function [y] = my_forward_example(L,b)
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
end

function [L,U] = my_bandLU_example(A, m, n, bandWidth)
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

