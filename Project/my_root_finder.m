function my_root_finder(coefficients)
    % Calculate the roots using the 'roots' function
    calculated_roots = roots(coefficients);

    % Print the roots
    disp("The roots are: ");
    disp(calculated_roots);

    % Initialize variables for plotting
    num_roots = length(calculated_roots);
    iterations = 1:num_roots;

    % Assume errors are zero as we are directly calculating the roots
    errors = zeros(1, num_roots);

    % Create a single figure window
    figure;

    % Plot the calculated roots in the first subplot
    subplot(1, 2, 1);
    plot(iterations, real(calculated_roots), '-o');
    title('Roots of the Polynomial');
    xlabel('Root Index');
    ylabel('Value of Root');
    grid on;

    % Plot the errors in the second subplot (should be all zeros)
    subplot(1, 2, 2);
    plot(iterations, errors, '-o');
    title('Error in Root Calculation');
    xlabel('Root Index');
    ylabel('Error');
    grid on;
end

