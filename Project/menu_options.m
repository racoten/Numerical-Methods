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
    disp('9. All');
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

            [root_bisection, error_bisection] = bisection_method_project1(x_l, x_u, func, e_a, i);
            disp(['Estimated Root (Bisection): ', num2str(root_bisection(end))]);
            disp(['Error Approximation (Bisection): ', num2str(error_bisection(end)), '%']);

            figure; % Create a new figure
            subplot(2,1,1); % Split the figure into 2 plots - This is for the root
            plot(1:length(root_bisection), root_bisection, '-o');
            title('Estimated Root (Bisection) vs. Iteration');
            xlabel('Iteration');
            ylabel('Estimated Root');

            subplot(2,1,2); % This is for the error
            plot(1:length(error_bisection), error_bisection, '-o');
            title('Error Approximation (Bisection) vs. Iteration');
            xlabel('Iteration');
            ylabel('Error Approximation (%)');


        case 2
            disp('You selected False Position.');

            func = input('Enter the function of x: ', 's');

            x_l = input('Enter the lower bound (x_l): ');
            x_u = input('Enter the upper bound (x_u): ');
            e_a = input('Enter the error tolerance (e_a, in percentage): ');
            i = input('Enter the maximum number of iterations (i): ');

            [root_false_position, error_false_position] = false_position_method_project1(x_l, x_u, func, e_a, i);
            disp(['Estimated Root (False Position): ', num2str(root_false_position(end))]);
            disp(['Error Approximation (False Position): ', num2str(error_false_position(end)), '%']);

            figure; % Create a new figure
            subplot(2,1,1); % Split the figure into 2 plots - This is for the root
            plot(1:length(root_false_position), root_false_position, '-o');
            title('Estimated Root (False Position) vs. Iteration');
            xlabel('Iteration');
            ylabel('Estimated Root');

            subplot(2,1,2); % This is for the error
            plot(1:length(error_false_position), error_false_position, '-o');
            title('Error Approximation (False Position) vs. Iteration');
            xlabel('Iteration');
            ylabel('Error Approximation (%)');

        case 3
            disp('You selected Fixed-Point Iteration.');

            func = input('Enter the function f(x) for Fixed-Point Iteration: ', 's');
            g_func = input('Enter the function g(x) for Fixed-Point Iteration: ', 's');

            x_0 = input('Enter the initial guess (x_0): ');
            e_a = input('Enter the error tolerance (e_a, in percentage): ');
            i = input('Enter the maximum number of iterations (i): ');

            [root_fixed_point, error_fixed_point] = fixed_point_iteration_project1(x_0, func, g_func, e_a, i);
            disp(['Estimated Root (Fixed-Point Iteration): ', num2str(root_fixed_point(end))]);
            disp(['Error Approximation (Fixed-Point Iteration): ', num2str(error_fixed_point(end)), '%']);

            figure; % Create a new figure
            subplot(2,1,1); % Split the figure into 2 plots - This is for the root
            plot(1:length(root_fixed_point), root_fixed_point, '-o');
            title('Estimated Root (Fixed-Point Iteration) vs. Iteration');
            xlabel('Iteration');
            ylabel('Estimated Root');

            subplot(2,1,2); % This is for the error
            plot(1:length(error_fixed_point), error_fixed_point, '-o');
            title('Error Approximation (Fixed-Point Iteration) vs. Iteration');
            xlabel('Iteration');
            ylabel('Error Approximation (%)');


        case 4
            disp('You selected Newton Method.');

            func_str = input('Enter the name of the function for root finding (e.g., "trajectory_equation"): ', 's');
            func_prime_str = input('Enter the name of the derivative function (e.g., "d_trajectory_equation"): ', 's');

            x_0 = input('Enter the initial guess (x_0): ');
            e_a = input('Enter the error tolerance (e_a, in percentage): ');
            i = input('Enter the maximum number of iterations (i): ');

            [root_newton, error_newton] = newton_method_project1(x_0, func_str, func_prime_str, e_a, i);
            disp(['Estimated Root (Newton): ', num2str(root_newton(end))]);
            disp(['Error Approximation (Newton): ', num2str(error_newton(end)), '%']);

            figure; % Create a new figure
            subplot(2,1,1); % Split the figure into 2 plots - This is for the root
            plot(1:length(root_newton), root_newton, '-o');
            title('Estimated Root (Newton Method) vs. Iteration');
            xlabel('Iteration');
            ylabel('Estimated Root');

            subplot(2,1,2); % This is for the error
            plot(1:length(error_newton), error_newton, '-o');
            title('Error Approximation (Newton Method) vs. Iteration');
            xlabel('Iteration');
            ylabel('Error Approximation (%)');


        case 5
            disp('You selected Secant.');
            x0 = input('Enter x0: ');
            x1 = input('Enter x1: ');
            func_str = input('Enter function as a string: ', 's');
            tolerance = input('Enter error tolerance: ');
            max_iter = input('Enter max iterations: ');

            [root_secant, error_secant] = secant_method_project1(x0, x1, func_str, tolerance, max_iter);

            % Get the last non-NaN value for root and error
            last_valid_root = root_secant(find(~isnan(root_secant), 1, 'last'));
            last_valid_error = error_secant(find(~isnan(error_secant), 1, 'last'));

            disp(['Estimated Root (Secant): ', num2str(last_valid_root)]);
            disp(['Error Approximation (Secant): ', num2str(last_valid_error), '%']);

            figure; % Create a new figure

            subplot(2,1,1); % Split the figure into 2 plots - This is for the root
            plot(1:length(root_secant), root_secant, '-o');
            title('Estimated Root (Secant Method) vs. Iteration');
            xlabel('Iteration');
            ylabel('Estimated Root');

            subplot(2,1,2); % This is for the error
            plot(1:length(error_secant), error_secant, '-o');
            title('Error Approximation (Secant Method) vs. Iteration');
            xlabel('Iteration');
            ylabel('Error Approximation (%)');

        case 6
            disp('You selected Modified Secant.');
            x0 = input('Enter x0: ');
            delta = input('Enter delta: ');
            func_str = input('Enter function as a string: ', 's');
            tolerance = input('Enter error tolerance: ');
            max_iter = input('Enter max iterations: ');

            [root_modified_secant, error_modified_secant] = modified_secant_method_project1(x0, delta, func_str, tolerance, max_iter);
            disp(['Estimated Root (Modified Secant): ', num2str(root_modified_secant(end))]);
            disp(['Error Approximation (Modified Secant): ', num2str(error_modified_secant(end)), '%']);

            figure; % Create a new figure
            subplot(2,1,1); % Split the figure into 2 plots - This is for the root
            plot(1:length(root_modified_secant), root_modified_secant, '-o');
            title('Estimated Root (Modified Secant Method) vs. Iteration');
            xlabel('Iteration');
            ylabel('Estimated Root');

            subplot(2,1,2); % This is for the error
            plot(1:length(error_modified_secant), error_modified_secant, '-o');
            title('Error Approximation (Modified Secant Method) vs. Iteration');
            xlabel('Iteration');
            ylabel('Error Approximation (%)');

        case 7
            disp('You selected MATLAB fzero.');
            func_str = input('Enter function as a string (e.g., "x^2 - 9"): ', 's');
            x0 = input('Enter a starting point: ');

            [root_fzero, error_fzero] = fzero_method_project1(func, x_l, e_a, i);
            disp(['Estimated Root: ', num2str(root_fzero(end))]);
            disp(['Error Approximation: ', num2str(error_fzero(end)), '%']);

            figure; % Create a new figure
            subplot(2,1,1); % Split the figure into 2 plots - This is for the root
            plot(1:length(root_fzero), root_fzero, '-o');
            title('Estimated Root (fzero) vs. Iteration');
            xlabel('Iteration');
            ylabel('Estimated Root');

            subplot(2,1,2); % This is for the error
            plot(1:length(error_fzero), error_fzero, '-o');
            title('Error Approximation (fzero) vs. Iteration');
            xlabel('Iteration');
            ylabel('Error Approximation (%)');

        case 8
            disp('You selected Muller.');
            x0 = input('Enter x0: ');
            x1 = input('Enter x1: ');
            x2 = input('Enter x2: ');
            func_str = input('Enter function as a string: ', 's');
            tolerance = input('Enter error tolerance: ');
            max_iter = input('Enter max iterations: ');

            [root, error_muller] = muller_project1(x_l, x_u, x_0, func, e_a, i);
            disp(['Estimated Root (Modified Secant): ', num2str(root(end))]);
            disp(['Error Approximation (Modified Secant): ', num2str(error_muller(end)), '%']);

            figure; % Create a new figure
            subplot(2,1,1); % Split the figure into 2 plots - This is for the root
            plot(1:length(root), root, '-o');
            title('Estimated Root (Muller) vs. Iteration');
            xlabel('Iteration');
            ylabel('Estimated Root');

            subplot(2,1,2); % This is for the error
            plot(1:length(error_muller), error_muller, '-o');
            title('Error Approximation (Muller) vs. Iteration');
            xlabel('Iteration');
            ylabel('Error Approximation (%)');

        case 9
            disp('You selected to execute ALL methods.');

            % Ask if the function requires more than one input
            multiInput = input('Does the function require more than one input (y/n)? ', 's');
            if multiInput == 'y'
                % Common additional parameter input
                additionalParam = input('Enter the additional parameter (e.g., Re for Reynolds number): ');
            end

            % Common Inputs for all applicable methods
            x_l = input('Enter the lower bound (x_l) for all applicable methods: ');
            x_u = input('Enter the upper bound (x_u) for all applicable methods: ');
            x_0 = input('Enter the initial guess (x_0) for all applicable methods: ');
            e_a = input('Enter the error tolerance (e_a, in percentage) for all applicable methods: ');
            i = input('Enter the maximum number of iterations (i) for all applicable methods: ');
            delta = input('Enter delta for Modified Secant Method: ');  % Specific to Modified Secant

            % Request for function handles directly
            if multiInput == 'y'
                % Since additional parameter is required, get the handles from the defined functions
                func_handle_name = input('Enter the name of the function for f(x): ');
                g_func_handle_name = input('Enter the name of the function for g(x) for Fixed-Point Iteration: ');
                func_prime_handle_name = input('Enter the name of the function for the derivative of f(x): ');

                % Creating function handles with the additional parameter locked in
                func = str2func([func_handle_name, '(', num2str(additionalParam), ')']);
                g_func = str2func([g_func_handle_name, '(', num2str(additionalParam), ')']);
                func_prime = str2func([func_prime_handle_name, '(', num2str(additionalParam), ')']);
            else
                % Request for function handles as input if no additional parameter is needed
                func = input('Enter the handle for the function of x: ');
                g_func = input('Enter the handle for the function g(x) for Fixed-Point Iteration: ');
                func_prime = input('Enter the handle for the derivative function: ');
            end

          % Bisection Method
          [root_bisection, error_bisection] = bisection_method_project1(x_l, x_u, func, e_a, i);

          % False Position Method
          [root_false_position, error_false_position] = false_position_method_project1(x_l, x_u, func, e_a, i);

          % Fixed-Point Iteration
          [root_fixed_point, error_fixed_point] = fixed_point_iteration_project1(x_0, func, g_func, e_a, i);

          % Newton Method
          [root_newton, error_newton] = newton_method_project1(x_l, func, func_prime, e_a, i);

          % Secant Method
          [root_secant, error_secant] = secant_method_project1(x_l, x_u, func, e_a, i);

          % Modified Secant Method
          [root_modified_secant, error_modified_secant] = modified_secant_method_project1(x_l, delta, func, e_a, i);

          % MATLAB fzero
          [root_fzero, error_fzero] = fzero_method_project1(func, x_l, e_a, i);

          % Get both root estimates and error approximations from Muller method
          [root, error_muller] = muller_project1(x_l, x_u, x_0, func, e_a, i);

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
          plot(error_muller, '->', 'DisplayName', 'Muller'); % Adding the Muller error plot
          hold off;
          xlabel('Iterations');
          ylabel('Error Approximations');
          title('Error Approximations Over Iterations');
          legend;

          disp('All methods executed.');

        case 10
            disp('Exiting...');
            break;

        otherwise
            disp('Invalid choice. Please enter a number between 1 and 10.');
    end
end

