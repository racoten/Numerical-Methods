function [L, U, P] = LU_pivot(A)
    [n, n1] = size(A);
    L = eye(n);
    P = eye(n);
    U = A;  % initialize matrices

    for j = 1 : n
        [pivot, m] = max(abs(U(j:n, j)));  % find the pivot element
        m = m + j - 1;  % index of pivot

        if m ~= j
            % interchange rows m and j in U
            temp1 = U(j,:);
            U(j,:) = U(m,:);
            U(m,:) = temp1;

            % interchange rows m and j in Permutation matrix P
            temp2 = P(j,:);
            P(j,:) = P(m,:);
            P(m,:) = temp2;

            if j >= 2  % interchange rows m and j in columns 1:j-1 of L
                temp3 = L(j,1:j-1);
                L(j,1:j-1) = L(m,1:j-1);
                L(m,1:j-1) = temp3;
            end
        end
    end

    for i = j+1 : n
        L(i,j) = U(i,j)/U(j,j);
        U(i,:) = U(i,:) - L(i,j)*U(j,:);
    end

    % display L and U
    L, U
    % verify results
    T1 = L*U
    T2 = P*A
end

