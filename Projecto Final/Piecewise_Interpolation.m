% Given data points
T = [0, 8, 16, 24, 32, 40]; % Temperature in degrees Celsius
O = [14.621, 11.843, 9.870, 8.418, 7.305, 6.413]; % Oxygen concentration in mg/L

% Fit piecewise linear interpolation
piecewiseLinear = @(T_query) interp1(T, O, T_query, 'linear');

% Estimate oxygen concentration at 27 degrees Celsius
O_at_27 = piecewiseLinear(27);

% Display the estimated oxygen concentration
fprintf('The estimated oxygen concentration at 27°C is %.3f mg/L\n', O_at_27);

% Plot the data and the piecewise linear interpolation
T_dense = linspace(min(T), max(T), 1000); % A dense range for a smooth plot
O_dense = piecewiseLinear(T_dense);

figure; % Create a new figure
plot(T, O, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % Plot the data points
hold on; % Hold the figure for the next plot
plot(T_dense, O_dense, 'b-'); % Plot the piecewise linear interpolation
plot(27, O_at_27, 'ks', 'MarkerFaceColor', 'g'); % Plot the estimated value at 27°C
xlabel('Temperature (°C)');
ylabel('Oxygen Concentration (mg/L)');
title('Piecewise Linear Interpolation of Oxygen Concentration');
legend('Data Points', 'Piecewise Linear Fit', 'Estimated Value at 27°C');
grid on; % Add a grid for better readability

% Print the exact value for comparison
fprintf('The exact oxygen concentration at 27°C is 7.986 mg/L\n');

