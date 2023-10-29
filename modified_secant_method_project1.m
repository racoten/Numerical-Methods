function modified_secant_method_project1(x0, delta, func_str, eps, max_iter)
    f = str2func(['@(x)', func_str]);
    [solution, no_iterations, x_vals, ea_vals] = modified_secant(f, x0, delta, eps, max_iter);

    if no_iterations > 0  % Solution found
        fprintf('Number of function calls: %d\n', 1 + no_iterations);
        fprintf('A solution is: %f\n', solution);
    else
        fprintf('Abort execution.\n');
    end

    % Create a single figure window
    figure;

    % Plot the convergence of the root in the first subplot
    subplot(1, 2, 1);
    plot(1:no_iterations, x_vals, '-o');
    title('Convergence of the Modified Secant Method for Root Finding');
    xlabel('Iteration');
    ylabel('Estimated Root x');
    grid on;

    % Plot the error approximation in the second subplot
    subplot(1, 2, 2);
    plot(1:no_iterations, ea_vals, '-o');
    title('Error Approximation of the Modified Secant Method');
    xlabel('Iteration');
    ylabel('Error Approximation (%)');
    grid on;
end

function [solution, no_iterations, x_vals, ea_vals] = modified_secant(f, x0, delta, eps, max_iter)
    f_x0 = f(x0);
    iteration_counter = 0;

    x_vals = [];
    ea_vals = [];

    while abs(f_x0) > eps && iteration_counter < max_iter
        try
            x1 = x0 + delta * x0; % Perturbed point
            f_x1 = f(x1);
            denominator = (f_x1 - f_x0);
            x = x0 - (f_x0 * (delta * x0)) / denominator;
        catch
            fprintf('Error! - denominator zero for x = %f\n', x0);
            break
        end

        % Calculate the error approximation
        ea = abs((x - x0) / x) * 100;

        % Store the values for plotting
        x_vals = [x_vals x];
        ea_vals = [ea_vals ea];

        x0 = x;
        f_x0 = f(x0);
        iteration_counter = iteration_counter + 1;
    end

    if abs(f_x0) > eps
        iteration_counter = -1;
    end

    solution = x0;
    no_iterations = iteration_counter;
end

