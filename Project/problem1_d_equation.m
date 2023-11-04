function dy = problem1_d_equation(theta_0)
    g = 9.81;  % gravitational acceleration
    v_0 = 30;  % initial velocity
    x = 90;    % horizontal distance

    dy = x * (sec(theta_0))^2 - (g * x^2 * sin(theta_0)) / (v_0^2 * (cos(theta_0))^3);
end

