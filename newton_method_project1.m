function root = newton_method_project1(x_0, func_str, func_prime_str, e_a, i)
    func = str2func(['@(x)', func_str]);
    func_prime = str2func(['@(x)', func_prime_str]);

    iter = 0;
    x = x_0;

    % Initialize vectors for storing x-values and errors for plotting
    x_vals = [];
    ea_vals = [];

    while iter < i
        x_old = x;

        % Compute the new estimate using the Newton formula
        x = x_old - func(x_old) / func_prime(x_old);

        % Store the new x value for plotting
        x_vals = [x_vals x];

        iter = iter + 1;

        if x ~= 0
            ea = abs((x - x_old) / x) * 100;

            % Store the new error value for plotting
            ea_vals = [ea_vals ea];

            if ea < e_a
                break;
            end
        end
    end

    root = x;
    disp(['The root is ', num2str(root), ' found in ', num2str(iter), ' iterations.']);

    % Create a single figure window
    figure;

    % Plot the convergence of the root in the first subplot
    subplot(1, 2, 1);
    plot(1:iter, x_vals, '-o');
    title('Convergence of the Newton Method for Root Finding');
    xlabel('Iteration');
    ylabel('Estimated Root x');
    grid on;

    % Plot the error approximation in the second subplot
    subplot(1, 2, 2);
    plot(1:iter, ea_vals, '-o');
    title('Error Approximation of the Newton Method');
    xlabel('Iteration');
    ylabel('Error Approximation (%)');
    grid on;

end

