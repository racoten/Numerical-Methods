function y = problem1_equation(theta_0)
    g = 9.81;  % gravitational acceleration
    v_0 = 30;  % initial velocity
    x = 90;    % horizontal distance
    y_0 = 1.8; % initial height

    y = tan(theta_0) * x - (g * x^2) / (2 * v_0^2 * (cos(theta_0))^2) + y_0 - 1;
endfunction
