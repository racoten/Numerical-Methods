% Define the x values
x_vals = linspace(0, 2, 1000);  % Here, I've chosen a range of 0 to 2 meters. Adjust if necessary.

% Evaluate the function at these x values
F_diff_vals = arrayfun(problem2_equation, x_vals);

% Plot the function vs. x values
plot(x_vals, F_diff_vals);
xlabel('Distance x (m)');
ylabel('Difference in Force (N)');
title('Force Difference vs. Distance');
grid on;

% Look for sign changes to detect possible root brackets
for i = 2:length(F_diff_vals)
    if sign(F_diff_vals(i)) ~= sign(F_diff_vals(i-1))
        fprintf('Possible bracket found: [%f, %f]\n', x_vals(i-1), x_vals(i));
    end
end

