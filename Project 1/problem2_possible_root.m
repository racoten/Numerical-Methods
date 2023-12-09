% Define the function as an anonymous function
problem2_equation = @(x) (1 / (4 * pi * 8.9e-12)) * (2e-5 * 2e-5 * x) / ((x^2 + 0.85^2)^(3/2)) - 1.25;

% Define the range for x
x_vals = linspace(0, 2, 1000);

% Calculate the function values across the range of x
F_diff_vals = arrayfun(problem2_equation, x_vals);

% Look for sign changes
for i = 2:length(F_diff_vals)
    if sign(F_diff_vals(i)) ~= sign(F_diff_vals(i-1))
        fprintf('Possible bracket found between x = %f and x = %f\n', x_vals(i-1), x_vals(i));
        % Update lower and upper bounds if necessary
    end
end

