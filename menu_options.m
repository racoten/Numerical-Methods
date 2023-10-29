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
    disp('10. Exit');

    choice = input('Enter the number corresponding to your choice: ');

    switch choice
        case 1
            disp('You selected Bisection.');

            func = input('Enter the function of x: ', 's');

            x_l = input('Enter the lower bound (x_l): ');
            x_u = input('Enter the upper bound (x_u): ');
            e_a = input('Enter the error tolerance (e_a, in percentage): ');
            i = input('Enter the maximum number of iterations (i): ');

            root = bisection_method_project1(x_l, x_u, func, e_a, i);

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

            g_func = input('Enter the function g(x) for Fixed-Point Iteration: ', 's');

            x_0 = input('Enter the initial guess (x_0): ');
            e_a = input('Enter the error tolerance (e_a, in percentage): ');
            i = input('Enter the maximum number of iterations (i): ');

            root = fixed_point_iteration(x_0, g_func, e_a, i);

        case 4
            disp('You selected Newton Method.');

            root = newton_method();

        case 5
            disp('You selected Secant.');
            x0 = input('Enter x0: ');
            x1 = input('Enter x1: ');
            func_str = input('Enter function as a string: ', 's');
            tolerance = input('Enter error tolerance: ');
            max_iter = input('Enter max iterations: ');
            root = secant_method(x0, x1, func_str, tolerance, max_iter);

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
            disp('Exiting...');
            break;

        otherwise
            disp('Invalid choice. Please enter a number between 1 and 10.');
    end
end

