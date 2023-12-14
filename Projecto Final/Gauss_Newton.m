function a = Gauss_Newton(T, k, a, tol, itmax)
% Nonlinear Regression of k = k20 * theta^(T-20)
% using Gauss-Newton method

n = length(T);
disp(' iter k20 theta dk20 dtheta')

for iter = 1 : itmax
    k20 = a(1); theta = a(2);

    % Calculate residuals and Jacobian
    f = k20 * theta.^(T - 20);
    d = k - f;
    z = zeros(n, 2);
    z(:, 1) = -theta.^(T - 20);
    z(:, 2) = -k20 * log(theta) * theta.^(T - 20) .* (T - 20);

    % Calculate update
    JtJ = z' * z;
    Jtd = z' * d;
    % Check for singularity
    if rcond(JtJ) < 1e-15
        warning('Jacobian is singular or nearly singular. Regularization may be needed.');
        break;
    end
    da = JtJ \ Jtd;
    a = a + da';

    % Display iteration information
    disp([iter, a', da'])

    % Check for convergence
    if norm(da, inf) < tol
        disp('Gauss-Newton method has converged');
        break;
    end
end

% Since the actual function is not exp(-a0*x)cos(a1*x), the plotting section
% needs to be adjusted to reflect the correct model function.
xx = linspace(min(T), max(T), 100);
yy = a(1) * a(2).^(xx - 20);
H = plot(T, k, 'ro', xx, yy, 'b-');
xlabel('Temperature (°C)');
ylabel('Decay rate (per day)');
title('Nonlinear Regression using Gauss-Newton Method');
legend('Data Points', 'Fitted Model');
set(H, 'LineWidth', 1.0, 'MarkerSize', 7);
end

