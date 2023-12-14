% Given data points
T = [6, 12, 18, 24, 30]; % Temperature in degrees Celsius
k = [0.15, 0.20, 0.32, 0.45, 0.70]; % Decay rates per day

% Calculated values for k_20 and theta from linear regression
k_20 = 0.357;
theta = 1.067;

% Calculate the decay rate at 17 degrees Celsius
T_specific = 17;
k_at_T_specific = k_20 * (theta ^ (T_specific - 20));

% Display the calculated decay rate at 17 degrees Celsius
fprintf('The decay rate at %d°C is %.5f per day\n', T_specific, k_at_T_specific);

% Create a range of temperatures for plotting
T_range = linspace(min(T), max(T), 100);

% Calculate the decay rates using the model
k_model = k_20 * (theta .^ (T_range - 20));

% Plotting
figure; % Create a new figure
plot(T, k, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 8); % Original data points
hold on; % Hold the figure for the next plot
plot(T_range, k_model, 'b-'); % Model
plot(T_specific, k_at_T_specific, 'ks', 'MarkerFaceColor', 'g'); % Specific data point at 17°C

% Adding details to the plot
xlabel('Temperature (°C)');
ylabel('Decay Rate (per day)');
title('Decay Rate as a Function of Temperature');
legend('Original Data', 'Model', 'Value at 17°C');
grid on; % Add a grid for better readability

% Display the plot
hold off;

