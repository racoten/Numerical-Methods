Re_values = linspace(10000, 500000, 10);

figure;
hold on;
for Re = Re_values
    colebrook_eq = @(f) 1 / sqrt(f) - (4 * log10(Re * sqrt(f)) - 0.4);

    f_vals = linspace(0.001, 0.01, 1000);

    colebrook_vals = arrayfun(colebrook_eq, f_vals);

    plot(f_vals, colebrook_vals, 'DisplayName', ['Re = ' num2str(Re)]);

    for i = 2:length(colebrook_vals)
        if sign(colebrook_vals(i)) ~= sign(colebrook_vals(i-1))
            fprintf('For Re = %.0f, possible bracket found between f = %f and f = %f\n', Re, f_vals(i-1), f_vals(i));
        end
    end
end

grid on;
xlabel('Friction factor f');
ylabel('Function Value');
title('von Karman Equation for Different Reynolds Numbers');
legend('show');
hold off;

