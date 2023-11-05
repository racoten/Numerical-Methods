function fhandle = problem3_equation(Re)
    % This function creates a handle to the internal function with Re "locked in"
    fhandle = @(f) problem3_equation_internal(f, Re);
end

function residual = problem3_equation_internal(f, Re)
    % This is the von Karman equation with Re as a parameter
    lhs = 1 / sqrt(f);
    rhs = 4 * log10(Re * sqrt(f)) - 0.4;
    residual = lhs - rhs;
end

