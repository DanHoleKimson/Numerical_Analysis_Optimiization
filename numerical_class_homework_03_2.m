clearvars
close all
clc


x = -1:0.01:1;
f_x = sin(10*x) - 2*x;
tol = 1e-5;
figure,plot(x,f_x);
xlabel('x');
ylabel('sin(10*x) - 2*x');
grid;
fnc_handle = @A03_2;

[bi_start,bi_end,liter] = my_Bisection(-0.4,-0.1,tol,fnc_handle);

fprintf('Bisection start: %f\t',bi_start);
fprintf('Bisection end: %f\t',bi_end);
fprintf('iteration: %d\n',liter);

[bi_start,bi_end,liter] = my_Bisection(-0.1,0.1,tol,fnc_handle);
fprintf('Bisection start: %f\t',bi_start);
fprintf('Bisection end: %f\t',bi_end);
fprintf('iteration: %d\n',liter);

[bi_start,bi_end,liter] = my_Bisection(0.1,0.4,tol,fnc_handle);
fprintf('Bisection start: %f\t',bi_start);
fprintf('Bisection end: %f\t',bi_end);
fprintf('iteration: %d\n',liter);


fnc_handle_gx = @A03_2_gx;
fnc_handle_gx2 = @A03_02_gx2;
[bi_x,liter] = my_Fixed(-0.4,1,tol,fnc_handle_gx);
fprintf('FixedPoint: %f\titeration: %d\n',bi_x,liter);

[bi_x,liter] = my_Fixed(-0.1,1,tol,fnc_handle_gx2);
fprintf('FixedPoint: %f\titeration: %d\n',bi_x,liter);

[bi_x,liter ]= my_Fixed(0.4,1,tol,fnc_handle_gx);
fprintf('FixedPoint: %f\titeration: %d\n',bi_x,liter);

fnc_handle_dx = @A03_2_dx;
[newton_x,liter] = my_Newton(-0.4,1,tol,fnc_handle,fnc_handle_dx);
fprintf('Newton''s method: %f\titeration: %d\n',newton_x,liter);
[newton_x,liter] = my_Newton(-0.1,1,tol,fnc_handle,fnc_handle_dx);
fprintf('Newton''s method: %f\titeration: %d\n',newton_x,liter);
[newton_x,liter] = my_Newton(0.4,1,tol,fnc_handle,fnc_handle_dx);
fprintf('Newton''s method: %f\titeration: %d\n',newton_x,liter);

[secant_x,liter] = my_Secant(-0.4,-0.3,1,tol,fnc_handle);
fprintf('Secant method: %f\titeration: %d\n',secant_x,liter);
[secant_x,liter] = my_Secant(-0.15,-0.1,1,tol,fnc_handle);
fprintf('Secant method: %f\titeration: %d\n',secant_x,liter);
[secant_x,liter] = my_Secant(0.4,0.3,1,tol,fnc_handle);
fprintf('Secant method: %f\titeration: %d\n',secant_x,liter);