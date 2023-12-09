function theta_0 = g_of_problem1_equation(theta_0)
    g = 9.81;  % gravitational acceleration
    v_0 = 30;  % initial velocity
    x = 90;    % horizontal distance
    y_0 = 1.8; % initial height
    y = 0;     % target value

    % Calculate g(theta_0)
    theta_0 = atan((y + 1 - y_0 + (g * x^2) / (2 * v_0^2 * (cos(theta_0))^2)) / x);
endfunction

