function [x_vals, iter, ea_vals] = fzero_method_project1(f_func, x0, tol, max_iter)

    x_vals = [];
    ea_vals = [];
    x_old = x0;
    iter = 0;

    options = optimset('TolX', tol, 'MaxIter', max_iter, 'OutputFcn', @outfun);

    root = fzero(f_func, x0, options);

    function stop = outfun(x, optimValues, state)
        stop = false;
        iter = iter + 1;

        % Compute the approximate error if x is not zero
        if x ~= 0
            ea = abs((x - x_old) / x) * 100;
            ea_vals = [ea_vals, ea];
        end

        x_vals = [x_vals, x];
        x_old = x;
    end

    % Uncomment the following lines if you want to display the results in the Command Window
    fprintf('The root is: %f\n', root);
    fprintf('Found in %d iterations.\n', iter);
end

