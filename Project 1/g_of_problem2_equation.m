function x_new = g_of_problem2_equation(x)
    % Constants
    e_0 = 8.9e-12;  % C^2/(Nm^2)
    q = 2e-5;       % C
    Q = 2e-5;       % C
    a = 0.85;       % m (radius of the ring)
    F_target = 1.25; % N

    % g(x) for Fixed-Point Iteration
    x_new = (F_target * 4 * pi * e_0 * (x^2 + a^2)^(3/2)) / (q * Q);
end

