function [x_vals, iter, ea_vals] = newton_method_project1(x_0, func_handle, func_prime_handle, e_a, i)
    iter = 0;
    x = x_0;

    % Initialize vectors for storing x-values and errors for output
    x_vals = [];
    ea_vals = [];

    while iter < i
        x_old = x;

        % Compute the new estimate using the Newton formula
        x = x_old - feval(func_handle, x_old) / feval(func_prime_handle, x_old);

        % Store the new x value for output
        x_vals = [x_vals x];

        iter = iter + 1;

        if x ~= 0
            ea = abs((x - x_old) / x) * 100;

            % Store the new error value for output
            ea_vals = [ea_vals ea];

            if ea < e_a
                break;
            end
        end
    end

    % Return the root and error vectors
    disp(['The root is ', num2str(x), ' found in ', num2str(iter), ' iterations.']);
end

