function [xr, ea] = bisection_method_project1(xl, xu, func, es, maxit)
  % Find root using the bisection method.
  % Input: xl      lower bound
  %        xu      upper bound
  %        func    function to find the root for
  %        es      error tolerance
  %        maxit   maximum number of iterations
  % Output: xr     estimated root
  %         ea     approximate error

  a(1) = xl; b(1) = xu;
  ya(1) = feval(func, a(1)); yb(1) = feval(func, b(1));
  if ya(1) * yb(1) > 0.0
      error('Function has same sign at end points');
  end

  ea = []; % To store approximate relative error
  xi = []; % To store estimated roots

  for i = 1:maxit
      xi(i) = (a(i) + b(i)) / 2;
      y(i) = feval(func, xi(i));

      if i > 1
          ea(i) = abs((xi(i) - xi(i-1)) / xi(i)) * 100;
      else
          ea(i) = 100;
      end

      if y(i) == 0.0
          disp('Exact zero found'); break;
      elseif y(i) * ya(i) < 0
          a(i+1) = a(i); ya(i+1) = ya(i);
          b(i+1) = xi(i); yb(i+1) = y(i);
      else
          a(i+1) = xi(i); ya(i+1) = y(i);
          b(i+1) = b(i); yb(i+1) = yb(i);
      end

      if (i > 1) && (ea(i) < es)
          disp('Bisection method has converged'); break;
      end
  end

  if i >= maxit
      disp('Zero not found to desired tolerance');
  end

  xr = xi;
  ea = ea;
end

