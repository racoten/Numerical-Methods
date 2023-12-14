function z = Quadratic_LS(x, y)
  % Quadratic Least Squares regression function
  % input x and y as row or column vectors
  % (they are converted to column form if necessary)

  n = length(x); x = x(:); y = y(:);
  sx = sum(x); sx2 = sum(x.^2); sx3 = sum(x.^3); sx4 = sum(x.^4);
  sy = sum(y); sxy = sum(x.*y); sx2y = sum(x.^2.*y);
  A = [n sx sx2; sx sx2 sx3; sx2 sx3 sx4];
  r = [sy; sxy; sx2y];
  z = inv(A)*r; a0 = z(1); a1 = z(2); a2 = z(3);
  table = [ x y (a0+a1*x+a2*x.^2) (y-a0-a1*x-a2*x.^2)];
  disp(' x Y (a0+a1*x+a2*x^2) (y-a0-a1*x-a2*x^2) ')
  disp(table), err = sum(table(:,4).^2)

  St = sum((y - sy/n).^2); Sr = err;
  Syx = sqrt(Sr/(n-3)) % standard error of the estimate
  r = sqrt((St-Sr)/St) % correlation coefficient

  % plot the regression curve

  x1=min(x); x2=max(x); xx=x1:(x2-x1)/50:x2;
  yy=a0+a1*xx+a2*xx.^2;
  plot(x,y,'r*',xx,yy,'m');
end
