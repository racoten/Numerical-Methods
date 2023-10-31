function [x_vals, ea_vals] = secant_method_project1(x0, x1, func_str, eps, max_iter)
    [solution, no_iterations, x_vals, ea_vals] = secant(func_str, x0, x1, eps, max_iter);

    if no_iterations > 0  % Solution found
        fprintf('Number of function calls: %d\n', 2 + no_iterations);
        fprintf('A solution is: %f\n', solution);
    else
        fprintf('Abort execution.\n');
    end
end

function [solution, no_iterations, x_vals, ea_vals] = secant(func_str, x0, x1, eps, max_iter)
    f_x0 = feval(func_str, x0);
    f_x1 = feval(func_str, x1);
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
        f_x1 = feval(func_str, x1);

        % Store the new x value for output
        x_vals = [x_vals x];

        ea = abs((x1 - x0) / x1) * 100;

        % Store the new error value for output
        ea_vals = [ea_vals ea];

        iteration_counter = iteration_counter + 1;
    end

    if abs(f_x1) > eps
        iteration_counter = -1;
    end

    solution = x1;
    no_iterations = iteration_counter;
end

