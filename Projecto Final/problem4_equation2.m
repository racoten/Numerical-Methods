function d = problem4_equation2(H, f_handle)
  % Numerator: Integral of z * f(z) from 0 to H
  numerator = quad(@(z) z .* f_handle(z), 0, H);

  % Denominator: Integral of f(z) from 0 to H
  denominator = quad(@(z) f_handle(z), 0, H);

  % Calculate d
  d = numerator / denominator;
end

