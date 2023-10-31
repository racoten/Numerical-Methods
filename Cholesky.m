function [L, U] = Cholesky(A)
    % A is assumed to be symmetric
    % U is computed, and L = U'

    [n, m] = size(A);  % The dimension of A
    U = zeros(n,n);    % Initialize U

    for i = 1 : n
        U(i,i) = sqrt( A(i,i) - U(1:i-1,i)' * U(1:i-1,i) );

        for j = i+1:n
            U(i,j) = (A(i,j) - U(1:i-1,i)' * U(1:i-1,j)) / U(i,i);
        end
    end

    L = U';
end

