% Define the force function
function f = force_function(z, H)
    f = 200 * (z ./ (5 + z)) .* exp(-2 * z / H);
end

% Height of the mast
H = 30; % Replace with the actual height of the mast

% Define the numerator and denominator functions for d
numerator_function = @(z) z .* force_function(z, H);
denominator_function = @(z) force_function(z, H);

% Calculate the total force F
F = quad(denominator_function, 0, H);

% Calculate the numerator and denominator of d
numerator = quad(numerator_function, 0, H);
denominator = F; % This is the same as the total force

% Calculate d
d = numerator / denominator;

% Display the results
disp(['Total force F exerted on the mast: ', num2str(F), ' N']);
disp(['Line of action d: ', num2str(d), ' meters']);

