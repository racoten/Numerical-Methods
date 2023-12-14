% Given data points
T = [0, 8, 16, 24, 32, 40]; % Temperature in degrees Celsius
O = [14.621, 11.843, 9.870, 8.418, 7.305, 6.413]; % Oxygen concentration in mg/L

% Fit a fifth-order polynomial to the data
p = polyfit(T, O, 5);

% Estimate oxygen concentration at 27 degrees Celsius
O_at_27 = polyval(p, 27);

% Display the estimated oxygen concentration
fprintf('The estimated oxygen concentration at 27°C using a fifth-order polynomial is %.3f mg/L\n', O_at_27);

% Plot the data and the polynomial interpolation
T_dense = linspace(min(T), max(T), 1000); % A dense range for a smooth plot
O_dense = polyval(p, T_dense);

figure; % Create a new figure
plot(T, O, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % Plot the data points
hold on; % Hold the figure for the next plot
plot(T_dense, O_dense, 'b-'); % Plot the polynomial interpolation
plot(27, O_at_27, 'ks', 'MarkerFaceColor', 'g'); % Plot the estimated value at 27°C
xlabel('Temperature (°C)');
ylabel('Oxygen Concentration (mg/L)');
title('Fifth-Order Polynomial Interpolation of Oxygen Concentration');
legend('Data Points', 'Polynomial Fit', 'Estimated Value at 27°C');
grid on; % Add a grid for better readability

% Print the exact value for comparison
fprintf('The exact oxygen concentration at 27°C is 7.986 mg/L\n');

