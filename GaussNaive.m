function x = GaussNaive(A, b)
  [m, n] = size(A);
  if m ~= n, error('Matrix A must be square'); endif
  nb = n + 1;
  Aug = [A b];

  for k = 1: n-1
    for i = k+1 : n
      factor = Aug(i,k) / Aug(k,k);
      Aug(i,k:nb) = Aug(i,k:nb) - factor*Aug(k,k:nb);
    endfor;
  endfor

  x = zeros(n,1);
  x(n) = Aug(n,nb) / Aug(n,n);
  for i = n-1 : -1 : 1
    x(i) = (Aug(i,nb) - Aug(i,i+1:n)*x(i+1:n)) / Aug(i,i);
  endfor
endfunction
