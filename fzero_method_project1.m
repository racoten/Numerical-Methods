function fzero_method_project1(f_func_str, x0, tol, max_iter)
    f_func = str2func(['@(x)', f_func_str]);

    x_vals = [];
    ea_vals = [];
    x_old = x0;
    iter = 0;

    options = optimset('TolX', tol, 'MaxIter', max_iter, 'OutputFcn', @outfun);

    root = fzero(f_func, x0, options);

    % Output function to collect data during iterations
    function stop = outfun(x, optimValues, state)
        stop = false;
        iter = iter + 1;

        % Compute the approximate error if x is not zero
        if x != 0
            ea = abs((x - x_old) / x) * 100;
            ea_vals = [ea_vals, ea];
        end

        x_vals = [x_vals, x];
        x_old = x;
    end

    % Plotting
    figure;

    subplot(1, 2, 1);
    plot(1:length(x_vals), x_vals, '-o');
    title('Convergence of root approximation');
    xlabel('Iteration');
    ylabel('Estimated Root');
    grid on;

    subplot(1, 2, 2);
    plot(1:length(ea_vals), ea_vals, '-o');
    title('Error Approximation');
    xlabel('Iteration');
    ylabel('Error (%)');
    grid on;

    fprintf('The root is: %f\n', root);
    fprintf('Found in %d iterations.\n', iter);
end

