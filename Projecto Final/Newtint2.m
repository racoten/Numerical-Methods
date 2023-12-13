function [b, yint, err] = Newtint2(x, y, xx, true_y)
% Newtint2(x, y, xx, true_y):
% Modified Newton interpolation with error estimation.
% Uses an (n-1)-order Newton interpolating polynomial based in n data points (x, y)
% to evaluate the interpolated values of the dependent variable (yint)
% and the error of the interpolation at selected locations, xx.
% input:
% x = independent variable
% y = dependent variable
% xx = values of independent variable at which interpolation is calculated
% true_y = true values of the function at points xx for error calculation
% output:
% yint = interpolated values of dependent variable
% err = estimated error at interpolation points

% compute the finite divided differences in the form of a difference table
n = length(x);
% check the table size
if length(y) ~= n, error('x and y must be same length'); end
b = zeros(n,n);
% assign dependent variables to the first column of b.
b(:,1) = y(:); % the (:) ensures that y is a column vector.
for j = 2:n
    for i = 1:n-j+1
        b(i,j) = (b(i+1,j-1) - b(i,j-1))/(x(i+j-1) - x(i));
    end
end

% use the finite divided differences to interpolate
yint = zeros(size(xx));
err = zeros(size(xx)); % Initialize error vector
for k = 1:length(xx)
    xt = 1;
    yint(k) = b(1,1);
    for j = 1:n-1
        xt = xt*(xx(k) - x(j));
        yint(k) = yint(k) + b(1,j+1) * xt;
    end
    err(k) = true_y - yint(k); % Calculate the error for the specific xx
end

% Plotting part begins here
% Define a dense range of points for plotting the polynomial
x_dense = linspace(min(x), max(x), 100);
y_dense = zeros(size(x_dense));

% Calculate the interpolated values for the dense range
for k = 1:length(x_dense)
    xt = 1;
    y_dense(k) = b(1,1);
    for j = 1:n-1
        xt = xt * (x_dense(k) - x(j));
        y_dense(k) = y_dense(k) + b(1,j+1) * xt;
    end
end

fprintf('The interpolation error at x = %.2f is %.2f\n', xx, err);

% Plot the original data points and the true function values if provided
plot(x, y, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
hold on; % Hold on to plot the polynomial and error on the same figure
% Plot the interpolating polynomial
plot(x_dense, y_dense, 'b-', 'LineWidth', 2);
% Plot the error at interpolation points if true values are provided
if nargin > 3
    plot(xx, err, 'k*', 'MarkerSize', 8);
    legend('Data Points', 'Interpolating Polynomial', 'Error at Interpolation Points');
else
    legend('Data Points', 'Interpolating Polynomial');
end
xlabel('Independent variable x');
ylabel('Dependent variable y');
title('Newton Interpolating Polynomial and Error Estimation');
hold off; % Release the plot hold
end

