function f = Sum_Squares_Residuals(a,T,y)
  yp = a(1).*a(2).^(T-20);
  f = sum((y - yp).^2);
end
