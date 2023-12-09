function [xr, i, ea] = false_position_method_project1(xl, xu, func, es, maxit)
  % Find root near x1 using the false position method.
  % Input: func     string containing name of function
  %       xl, xu    initial guesses
  %       es        allowable tolerance in computed root
  %       maxit     maximum number of iterations
  % Output: xr      row vector of approximations to root
  %         ea      row vector of approximate relative error

  % Initialize
  a(1) = xl;
  b(1) = xu;
  ya(1) = feval(func, a(1));
  yb(1) = feval(func, b(1));

  if ya(1) * yb(1) > 0.0
    error('Function has same sign at end points');
  end

  ea = []; % To store approximate relative error

  for i = 1:maxit
    % Compute the root estimate
    xi(i) = b(i) - yb(i)*(b(i)-a(i))/(yb(i)-ya(i));
    y(i) = feval(func, xi(i));

    % Compute error after the first iteration
    if i > 1
      ea(i) = abs((xi(i) - xi(i-1)) / xi(i)) * 100;
    else
      ea(i) = 100; % For the first iteration, set error to 100%
    end

    % Check for exact zero
    if y(i) == 0.0
      disp('exact zero found');
      break;
    elseif y(i) * ya(i) < 0
      a(i+1) = a(i);
      ya(i+1) = ya(i);
      b(i+1) = xi(i);
      yb(i+1) = y(i);
    else
      a(i+1) = xi(i);
      ya(i+1) = y(i);
      b(i+1) = b(i);
      yb(i+1) = yb(i);
    end

    % Check for convergence
    if (i > 1) && (ea(i) < es)
      disp('False position method has converged');
      break;
    end
  end

  % Return the root and error vectors
  xr = xi;
  ea = ea;
end

