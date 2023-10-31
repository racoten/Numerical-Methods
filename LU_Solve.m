function x = LU_Solve(L, U, b)
  [n, m] = size(L); d = zeros(n, 1); x = zeros(n, 1);
  d(1) = b(1) / L(1, 1);

  for i = 2 : n
    d(i) = (b(i) - L(i, 1:i - 1) * d(1 : i - 1))/ L(i, i)
  endfor

  x(n) = d(n) / U(n, n);
  for i = n - 1: -1 : 1
    x(i) = (d(i) - U(i, i + 1: n) * x(i + 1: n)) / U(i, i)
  endfor

endfunction
