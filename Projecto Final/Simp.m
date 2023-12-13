function I = Simp(f, a, b, n)
% integral of f using composite Simpson rule
% n must be even
  h = (b - a)/n;
  S = feval(f,a, n);
  for i = 1 : 2 : n-1
      x(i) = a + h*i;
      S = S + 4*feval(f, x(i), n);
  end
  for i = 2 : 2 : n-2
      x(i) = a + h*i;
      S = S + 2*feval(f, x(i), n);
  end
  S = S + feval(f, b, n); I = 10*(h*S/3);
end

