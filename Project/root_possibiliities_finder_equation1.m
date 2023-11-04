% Define the theta values
theta_vals = linspace(0, pi/2, 1000);

% Evaluate the function at these theta values
y_vals = arrayfun(trajectory_equation, theta_vals);

% Plot the function vs. theta values
plot(theta_vals, y_vals);
xlabel('Theta (radians)');
ylabel('Function Value');
title('Trajectory Equation vs. Theta');
grid on;

% Create another set of theta values
theta_values = linspace(0, pi/2, 1000);

% Evaluate the function at these theta values
y_values = arrayfun(trajectory_equation, theta_values);

% Look for sign changes to detect possible root brackets
for i = 2:length(y_values)
    if sign(y_values(i)) ~= sign(y_values(i-1))
        fprintf('Possible bracket found: [%f, %f]\n', theta_values(i-1), theta_values(i));
    end
end

