function [x_vals, no_iterations, ea_vals] = secant_method_project1(x0, x1, func_str, eps, max_iter)
    [solution, no_iterations, x_vals, ea_vals] = secant(func_str, x0, x1, eps, max_iter);

    if no_iterations > 0  % Solution found
        fprintf('Number of function calls: %d\n', 2 + no_iterations);
        fprintf('A solution is: %f\n', solution);
    else
        fprintf('Abort execution. Solution not found within max_iter.\n');
    end
end

function [solution, no_iterations, x_vals, ea_vals] = secant(func_str, x0, x1, eps, max_iter)
    f_x0 = feval(func_str, x0);
    f_x1 = feval(func_str, x1);
    iteration_counter = 0;

    x_vals = NaN(1, max_iter);  % Initialize with NaN values
    ea_vals = NaN(1, max_iter); % Initialize with NaN values

    while iteration_counter < max_iter
        denominator = f_x1 - f_x0;
        if denominator == 0
            fprintf('Error! - denominator zero for x = %f\n', x1);
            solution = NaN;
            return;
        end

        x = x1 - (f_x1 * (x1 - x0) / denominator);
        ea = abs((x - x1) / x) * 100;

        if ea <= eps  % Convergence criterion
            break;
        end

        x0 = x1;
        x1 = x;
        f_x0 = f_x1;
        f_x1 = feval(func_str, x1);

        % Store the new x value and error value
        x_vals(iteration_counter + 1) = x;
        ea_vals(iteration_counter + 1) = ea;

        iteration_counter = iteration_counter + 1;
    end

    solution = x1;
    no_iterations = iteration_counter;
end


