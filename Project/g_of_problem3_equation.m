function fhandle = g_of_problem3_equation(Re)
    fhandle = @(f) (1 / (4 * log10(Re * sqrt(f)) - 0.4))^2;
end
