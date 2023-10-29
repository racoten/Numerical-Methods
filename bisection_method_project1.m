function [xr,y] = bisection_method_project1(func)
  % ... [rest of the comments and inputs]
  % Find root using the bisection method.
  % Input: func     string containing name of function
  %       xl,xu    initial guesses
  %       es       allowable tolerance in computed root
  %       maxit    maximum number of iterations
  % Output: x      row vector of approximations to root
  %         y      row vector of function values

  xl = input('enter lower bound xl = ');
  xu = input('enter upper bound xu = ');
  es = input('allowable tolerance es = ');
  maxit = input('maximum number of iterations maxit = ');

  a(1) = xl; b(1) = xu;
  ya(1) = feval(func, a(1)); yb(1) = feval(func, b(1));
  if ya(1) * yb(1) > 0.0
      error('Function has same sign at end points');
  end

  ea = []; % To store approximate relative error

  for i = 1:maxit
      xi(i) = (a(i) + b(i)) / 2;
      y(i) = feval(func, xi(i));

      % Compute error after the first iteration
      if i > 1
          ea(i) = abs((xi(i) - xi(i-1)) / xi(i)) * 100;
      else
          ea(i) = 100; % For the first iteration, set error to 100%
      end

      if y(i) == 0.0
          disp('exact zero found'); break;
      elseif y(i) * ya(i) < 0
          a(i+1) = a(i); ya(i+1) = ya(i);
          b(i+1) = xi(i); yb(i+1) = y(i);
      else
          a(i+1) = xi(i); ya(i+1) = y(i);
          b(i+1) = b(i); yb(i+1) = yb(i);
      end

      if (i > 1) & (ea(i) < es)
          disp('Bisection method has converged'); break;
      end
  end

  iter = i;

  if iter >= maxit
      disp('zero not found to desired tolerance');
  end

  n = length(xi); k = 1:n; out = [k' a(1:n)' b(1:n)' xi' y'];
  disp('    step       xl           xu           xr        f(xr)');
  disp(out);

  % Plotting xr
  figure;
  subplot(2,1,1);
  plot(1:iter, xi(1:iter), '-o');
  title('Convergence of the Bisection Method - Root');
  xlabel('Iteration');
  ylabel('Estimated Root xr');
  grid on;

  % Plotting error
  subplot(2,1,2);
  plot(1:iter, ea(1:iter), '-o');
  title('Convergence of the Bisection Method - Error');
  xlabel('Iteration');
  ylabel('Approximate Relative Error (%)');
  grid on;
end

