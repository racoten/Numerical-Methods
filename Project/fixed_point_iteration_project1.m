function [x_vals, ea_vals] = fixed_point_iteration_project1(x_0, f_func_str, g_func_str, e_a, i)
    iter = 0;
    x = x_0;

    x_vals = []; % To store root approximations
    ea_vals = []; % To store error approximations

    while iter < i
        x_old = x; % Store old value for error calculation

        % Step 1: Calculate y = g(x_0)
        y = feval(g_func_str, x);

        % Step 2: Let x1 = g(x_0)
        x1 = y;

        % Step 3: Examine if x1 is the solution of f(x) = 0
        f_x1 = feval(f_func_str, x1);

        x_vals = [x_vals x1]; % Store the new x value for plotting

        if abs(f_x1) < e_a
            break;
        end

        % Step 4: If not, repeat the iteration
        x = x1;

        ea = abs((x1 - x_old) / x1) * 100;
        ea_vals = [ea_vals ea]; % Store the new error value for plotting

        iter = iter + 1;
    end

    % Return the root and error vectors
    disp(['The root is ', num2str(x1), ' found in ', num2str(iter), ' iterations.']);
end

