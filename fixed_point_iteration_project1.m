function root = fixed_point_iteration_project1(x_0, f_func_str, g_func_str, e_a, i)
    iter = 0;
    x = x_0;
    f_func = str2func(['@(x)', f_func_str]);
    g_func = str2func(['@(x)', g_func_str]);

    x_vals = []; % To store root approximations
    ea_vals = []; % To store error approximations

    while iter < i
        % Step 1: Calculate y = g(x_0)
        y = g_func(x);

        % Step 2: Let x_1 = g(x_0)
        x1 = y;

        % Step 3: Examine if x1 is the solution of f(x) = 0
        f_x1 = f_func(x1);

        x_vals = [x_vals x1]; % Store the new x value for plotting

        if abs(f_x1) < e_a
            break;
        end

        % Step 4: If not, repeat the iteration
        x = x1;

        ea = abs((x1 - x) / x1) * 100;
        ea_vals = [ea_vals ea]; % Store the new error value for plotting

        iter = iter + 1;
    end

    % Plotting
    figure;

    subplot(1, 2, 1);
    plot(1:length(x_vals), x_vals, '-o');
    title('Convergence of Fixed-Point Iteration');
    xlabel('Iteration');
    ylabel('Estimated Root');
    grid on;

    subplot(1, 2, 2);
    plot(1:length(ea_vals), ea_vals, '-o');
    title('Error Approximation');
    xlabel('Iteration');
    ylabel('Error (%)');
    grid on;

    root = x1;
    disp(['The root is ', num2str(root), ' found in ', num2str(iter), ' iterations.']);
end

