% Define the constants K and Ta
K = 0.4993;
Ta = 20;

% Final temperature at which we want to find the time (37°C assumed for body temperature at time of death)
T_final = 17;

% Solve for time using the rearranged algebraic equation
% T - Ta = e^(-K * t * (T - Ta))
% Taking logarithms we get:
% ln((T_final - Ta) / (37 - Ta)) = -K * t * (9.5)
% t = ln((T_final - Ta) / (9.5)) / -K

t = 10*(log((T_final) / (29.5 - Ta)) / (-K * 9.5));

% Display the result
disp(['The estimated time of death is: ', num2str(t), ' hours']);

