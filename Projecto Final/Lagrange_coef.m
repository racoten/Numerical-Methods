function c = Lagrange_coef(x, y)
  n = length(x)
  for k = 1 : n
      d(k) = 1;
      for i = 1 : n
        if i ~= k
          d(k) = d(k)*(x(k) - x(i));
        endif

        c(k) = y(k)/d(k);
      endfor
  endfor
end
