function dTdt = problem5_equation(t, T)
  K = 0.4993;
  Ta = 20;
  dTdt = -K * (T - Ta);
end
