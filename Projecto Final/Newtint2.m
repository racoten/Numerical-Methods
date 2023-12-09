function [b, yint] = Newtint2(x, y, xx)
% Newtint2(x, y, xx):
% Newton interpolation. Uses an (n-1)-order Newton
% interpolating polynomial based in n data points (x, y)
% to evaluate the interpolated values of the dependent variable (yint)
% at selected locations, xx.
% input:
% x = independent variable
% y = dependent variable
% xx = values of independent variable at which interpolation is calculated
% output:
% yint = interpolated values of dependent variable
%
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
for k = 1:length(xx)
    xt = 1;
    yint(k) = b(1,1);
    for j = 1:n-1
        xt = xt*(xx(k) - x(j));
        yint(k) = yint(k) + b(1,j+1) * xt;
    end
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

% Plot the original data points
plot(x, y, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
hold on; % Hold on to plot the polynomial on the same figure
% Plot the interpolating polynomial
plot(x_dense, y_dense, 'b-', 'LineWidth', 2);
xlabel('Independent variable x');
ylabel('Dependent variable y');
title('Newton Interpolating Polynomial');
legend('Data Points', 'Interpolating Polynomial');
hold off; % Release the plot hold
end

