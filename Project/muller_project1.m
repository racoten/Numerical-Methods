function [estimated_roots, i, approx_errors] = muller_project1(p0, p1, p2, func, TOL, N0)
    format long;

    h1 = p1 - p0;
    h2 = p2 - p1;
    DELTA1 = (feval(func, p1) - feval(func, p0)) / h1;
    DELTA2 = (feval(func, p2) - feval(func, p1)) / h2;
    d = (DELTA2 - DELTA1) / (h2 + h1);
    i = 3;

    % Initializing arrays to store estimated roots and approximations
    estimated_roots = [];
    approx_errors = [];

    while i <= N0
        b = DELTA2 + h2 * d;
        D = sqrt(b^2 - 4 * feval(func, p2) * d);

        if abs(b - D) < abs(b + D)
            E = b + D;
        else
            E = b - D;
        end

        h = -2 * feval(func, p2) / E;
        p = p2 + h;

        % Storing the estimated root and approximation error
        estimated_roots = [estimated_roots, p];
        approx_errors = [approx_errors, abs(h)];

        if abs(h) < TOL
            disp(p);
            break;
        end

        p0 = p1;
        p1 = p2;
        p2 = p;
        h1 = p1 - p0;
        h2 = p2 - p1;
        DELTA1 = (feval(func, p1) - feval(func, p0)) / h1;
        DELTA2 = (feval(func, p2) - feval(func, p1)) / h2;
        d = (DELTA2 - DELTA1) / (h2 + h1);
        i = i + 1;
    end

    if i > N0
        formatSpec = 'The method failed after N0 iterations, N0= %d \n';
        fprintf(formatSpec, N0);
    end
end

