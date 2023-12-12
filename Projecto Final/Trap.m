function I = Trap(func, a, b, n)
  x = a;
  h = (b - a)/n;
  S = feval(func, a, n);
  for j = 1 : n - 1
    x = x + h;
    S = S + 2 * feval(func, x, n);
  endfor

  S = S + feval(func, b, n);
  I = (10)* ((b - a)*S / (2*n));
end

