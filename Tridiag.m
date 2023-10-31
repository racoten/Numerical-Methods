function x = Tridiag(e, f, g, r)
  n = length(f);

  for k = 2 : n
    factor = e(k) / f(k - 1);
    f(k) = f(k) - factor * g(k - 1);
    r(k) = r(k) - factor * r(k - 1);
  endfor

  x(n) = r(n) / f(n);
  for k = n - 1: -1: 1
    x(k) = (r(k) - g(k) * x(k + 1)) / f(k);
  endfor
endfunction
