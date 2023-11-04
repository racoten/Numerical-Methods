function fhandle = problem3_equation(Re)
    % This function creates a handle to the internal function with Re "locked in"
    fhandle = @(f) problem3_equation_internal(f, Re);
end

