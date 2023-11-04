function F_diff_prime = problem2_d_equation(x)
    % Constants
    e_0 = 8.9e-12;  % C^2/(Nm^2)
    q = 2e-5;       % C
    Q = 2e-5;       % C
    a = 0.85;       % m (radius of the ring)

    % Equation for dF/dx
    numerator = (x^2 + a^2)^(3/2) - 3 * x^2 * (x^2 + a^2)^(1/2);
    denominator = (x^2 + a^2)^3;
    F_diff_prime = 1 / (4 * pi * e_0) * (q * Q * numerator) / denominator;
end

