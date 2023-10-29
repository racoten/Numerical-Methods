function secant_method_project1(x0, x1, func_str, eps, max_iter)
    f = str2func(['@(x)', func_str]);
    [solution, no_iterations, x_vals, ea_vals] = secant(f, x0, x1, eps, max_iter);

    if no_iterations > 0  % Solution found
        fprintf('Number of function calls: %d\n', 2 + no_iterations);
        fprintf('A solution is: %f\n', solution);
    else
        fprintf('Abort execution.\n');
    end

    % Create a single figure window
    figure;

    % Plot the convergence of the root in the first subplot
    subplot(1, 2, 1);
    plot(1:no_iterations, x_vals, '-o');
    title('Convergence of the Secant Method for Root Finding');
    xlabel('Iteration');
    ylabel('Estimated Root x');
    grid on;

    % Plot the error approximation in the second subplot
    subplot(1, 2, 2);
    plot(1:no_iterations, ea_vals, '-o');
    title('Error Approximation of the Secant Method');
    xlabel('Iteration');
    ylabel('Error Approximation (%)');
    grid on;
end

function [solution, no_iterations, x_vals, ea_vals] = secant(f, x0, x1, eps, max_iter)
    f_x0 = f(x0);
    f_x1 = f(x1);
    iteration_counter = 0;

    x_vals = [];
    ea_vals = [];

    while abs(f_x1) > eps && iteration_counter < max_iter
        try
            denominator = (f_x1 - f_x0) / (x1 - x0);
            x = x1 - f_x1 / denominator;
        catch
            fprintf('Error! - denominator zero for x = %f\n', x1);
            break
        end

        x0 = x1;
        x1 = x;
        f_x0 = f_x1;
        f_x1 = f(x1);

        % Store the new x value for plotting
        x_vals = [x_vals x];

        ea = abs((x1 - x0) / x1) * 100;

        % Store the new error value for plotting
        ea_vals = [ea_vals ea];

        iteration_counter = iteration_counter + 1;
    end

    if abs(f_x1) > eps
        iteration_counter = -1;
    end

    solution = x1;
    no_iterations = iteration_counter;
end

