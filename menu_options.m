while true
    disp('Select an option:');
    disp('1. Bisection');
    disp('2. False Position');
    disp('3. Fixed-Point iteration');
    disp('4. Newton');
    disp('5. Secant');
    disp('6. Modified Secant');
    disp('7. MATLAB fzero');
    disp('8. Muller');
    disp('9. MATLAB roots');
    disp('10. All');
    disp('11. Exit');

    choice = input('Enter the number corresponding to your choice: ');

    switch choice
        case 1
            disp('You selected Bisection.');
            func = input('Enter the function of x: ', 's');
            x_l = input('Enter the lower bound (x_l): ');
            x_u = input('Enter the upper bound (x_u): ');
            e_a = input('Enter the error tolerance (e_a, in percentage): ');
            i = input('Enter the maximum number of iterations (i): ');

            [root_bisection, error_bisection] = bisection_method_project1(x_l, x_u, func, e_a, i);

        case 2
            disp('You selected False Position.');

            func = input('Enter the function of x: ', 's');

            x_l = input('Enter the lower bound (x_l): ');
            x_u = input('Enter the upper bound (x_u): ');
            e_a = input('Enter the error tolerance (e_a, in percentage): ');
            i = input('Enter the maximum number of iterations (i): ');

            root = false_position_method(x_l, x_u, func, e_a, i);

        case 3
            disp('You selected Fixed-Point Iteration.');

            func = input('Enter the function f(x) for Fixed-Point Iteration: ', 's');
            g_func = input('Enter the function g(x) for Fixed-Point Iteration: ', 's');

            x_0 = input('Enter the initial guess (x_0): ');
            e_a = input('Enter the error tolerance (e_a, in percentage): ');
            i = input('Enter the maximum number of iterations (i): ');

            root = fixed_point_iteration_project1(x_0, func, g_func, e_a, i);

        case 4
          disp('You selected Newton Method.');

          func_str = input('Enter the name of the function for root finding (e.g., "trajectory_equation"): ', 's');
          func_prime_str = input('Enter the name of the derivative function (e.g., "d_trajectory_equation"): ', 's');

          x_0 = input('Enter the initial guess (x_0): ');
          e_a = input('Enter the error tolerance (e_a, in percentage): ');
          i = input('Enter the maximum number of iterations (i): ');

          root = newton_method_project1(x_0, func_str, func_prime_str, e_a, i);

        case 5
            disp('You selected Secant.');
            x0 = input('Enter x0: ');
            x1 = input('Enter x1: ');
            func_str = input('Enter function as a string: ', 's');
            tolerance = input('Enter error tolerance: ');
            max_iter = input('Enter max iterations: ');
            root = secant_method_project1(x0, x1, func_str, tolerance, max_iter);

        case 6
            disp('You selected Modified Secant.');
            x0 = input('Enter x0: ');
            delta = input('Enter delta: ');
            func_str = input('Enter function as a string: ', 's');
            tolerance = input('Enter error tolerance: ');
            max_iter = input('Enter max iterations: ');
            root = modified_secant_method(x0, delta, func_str, tolerance, max_iter);

        case 7
            disp('You selected MATLAB fzero.');
            func_str = input('Enter function as a string (e.g., "x^2 - 9"): ', 's');
            x0 = input('Enter a starting point: ');
            root = fzero(func_str, x0);
            disp(['The root found is ', num2str(root)]);

        case 8
            disp('You selected Muller.');
            x0 = input('Enter x0: ');
            x1 = input('Enter x1: ');
            x2 = input('Enter x2: ');
            func_str = input('Enter function as a string: ', 's');
            tolerance = input('Enter error tolerance: ');
            max_iter = input('Enter max iterations: ');
            root = muller_method(x0, x1, x2, func_str, tolerance, max_iter);

        case 9
            disp('You selected MATLAB roots.');
            coef_str = input('Enter coefficients of polynomial separated by space (e.g., "2 0 -3 3 -4"): ', 's');
            coefficients = str2num(coef_str);
            roots_result = roots(coefficients);
            disp('The roots are:');
            disp(roots_result);

        case 10
          disp('You selected to execute ALL methods.');

          % Common Inputs for all applicable methods
          func = input('Enter the function of x for all applicable methods: ', 's');
          x_l = input('Enter the lower bound (x_l) for all applicable methods: ');
          x_u = input('Enter the upper bound (x_u) for all applicable methods: ');
          x_0 = input('Enter the initial guess (x_0) for all applicable methods: ');
          e_a = input('Enter the error tolerance (e_a, in percentage) for all applicable methods: ');
          i = input('Enter the maximum number of iterations (i) for all applicable methods: ');
          g_func = input('Enter the function g(x) for Fixed-Point Iteration: ', 's');  % Specific to Fixed-Point
          func_prime = input('Enter the name of the derivative function: ', 's');  % Specific to Newton
          delta = input('Enter delta for Modified Secant Method: ');  % Specific to Modified Secant

          % Bisection Method
          disp('Executing Bisection Method...');
          [root_bisection, error_bisection] = bisection_method_project1(x_l, x_u, func, e_a, i);
          disp(['Bisection root: ', num2str(root_bisection)]);

          % False Position Method
          disp('Executing False Position Method...');
          [root_false_position, error_false_position] = false_position_method_project1(x_l, x_u, func, e_a, i);
          disp(['False Position root: ', num2str(root_false_position)]);

          % Fixed-Point Iteration
          disp('Executing Fixed-Point Iteration...');
          [root_fixed_point, error_fixed_point] = fixed_point_iteration_project1(x_0, func, g_func, e_a, i);
          disp(['Fixed-Point Iteration root: ', num2str(root_fixed_point)]);

          % Newton Method
          disp('Executing Newton Method...');
          [root_newton, error_newton] = newton_method_project1(x_l, func, func_prime, e_a, i);
          disp(['Newton Method root: ', num2str(root_newton)]);

          % Secant Method
          disp('Executing Secant Method...');
          [root_secant, error_secant] = secant_method_project1(x_l, x_u, func, e_a, i);
          disp(['Secant Method root: ', num2str(root_secant)]);

          % Modified Secant Method
          disp('Executing Modified Secant Method...');
          [root_modified_secant, error_modified_secant] = modified_secant_method_project1(x_l, delta, func, e_a, i);
          disp(['Modified Secant root: ', num2str(root_modified_secant)]);

          % MATLAB fzero
          disp('Executing MATLAB fzero...');
          [root_fzero, error_fzero] = fzero(func, x_l, e_a, i);
          disp(['MATLAB fzero root: ', num2str(root)]);

          % Muller Method
          disp('Executing Muller Method...');
          root = muller_method(x_l, x_u, x_0, func, e_a, i);
          disp(['Muller Method root: ', num2str(root)]);

          % Initialize figure for plotting
          figure;

          % Subplot for root estimates
          subplot(2,1,1);
          plot(root_bisection, '-o', 'DisplayName', 'Bisection');
          hold on;
          plot(root_false_position, '-x', 'DisplayName', 'False Position');
          plot(root_fixed_point, '-s', 'DisplayName', 'Fixed-Point');
          plot(root_newton, '-d', 'DisplayName', 'Newton');
          plot(root_secant, '-^', 'DisplayName', 'Secant');
          plot(root_modified_secant, '-v', 'DisplayName', 'Modified Secant');
          plot(root_fzero, '-<', 'DisplayName', 'fzero');
          plot(root, '->', 'DisplayName', 'Muller');
          hold off;
          xlabel('Iterations');
          ylabel('Root Estimates');
          title('Root Estimates Over Iterations');
          legend;

          % Subplot for error approximations
          subplot(2,1,2);
          plot(error_bisection, '-o', 'DisplayName', 'Bisection');
          hold on;
          plot(error_false_position, '-x', 'DisplayName', 'False Position');
          plot(error_fixed_point, '-s', 'DisplayName', 'Fixed-Point');
          plot(error_newton, '-d', 'DisplayName', 'Newton');
          plot(error_secant, '-^', 'DisplayName', 'Secant');
          plot(error_modified_secant, '-v', 'DisplayName', 'Modified Secant');
          plot(error_fzero, '-<', 'DisplayName', 'fzero');
          hold off;
          xlabel('Iterations');
          ylabel('Error Approximations');
          title('Error Approximations Over Iterations');
          legend;

          disp('All methods executed.');

        case 11
            disp('Exiting...');
            break;

        otherwise
            disp('Invalid choice. Please enter a number between 1 and 10.');
    end
end

