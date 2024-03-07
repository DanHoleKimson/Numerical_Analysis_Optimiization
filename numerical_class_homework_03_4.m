clearvars
close all
clc

tol = 1e-5;
err = 1;
maxN = 100000;
xold = [1 1 1];
iterN = 0;

while err > tol && iterN < maxN
    iterN = iterN+1;
    xnew = fnc_g(xold);
    err = norm(xold - xnew);
    xold = xnew;
end

fprintf('Root of g(x): %f\t%f\t%f\n',xnew(1),xnew(2),xnew(3))

function y = fnc_g(x)
y = [
    -cos(x(1))/81 + (x(2)*x(2))/9 + sin(x(3))/3;
    sin(x(1))/3 + cos(x(3))/3;
    -cos(x(1))/9 + x(2)/3 + sin(x(3))/6];
end



