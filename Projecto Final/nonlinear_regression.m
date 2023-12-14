% Clear the workspace and close all figures
clearvars
close all

% Define the dataset
Temperature = [6 12 18 24 30];
DecayRate = [0.15 0.20 0.32 0.45 0.70];

%% Linear Transformation and Regression
% Transform the non-linear equation to a linear form
% By taking logarithms: log(k) = log(k20) + (T-20)*log(theta);

% Prepare data for linear regression
LogDecayRate = log(DecayRate);
TempForRegression = Temperature;
% Perform linear regression to obtain slope and intercept
coefficients = polyfit(TempForRegression, LogDecayRate, 1);

% Calculate the original parameters from the linear coefficients
theta_estimated = exp(coefficients(1));
k20_estimated = exp(coefficients(2) + 20 * log(theta_estimated));

% Generate a range for temperature and calculate the predicted decay rate
TempRange = linspace(min(Temperature), max(Temperature), 400);
PredictedDecay = k20_estimated * theta_estimated .^ (TempRange - 20);
EstimatedDecayAt17 = k20_estimated * theta_estimated .^ (17 - 20);

%% Non-linear Regression Analysis

% Objective function for non-linear regression
functionToMinimize = @Sum_Squares_Residuals;

% Optimize parameters using non-linear regression
optimizedParams = fminsearch(functionToMinimize, [1,1], [], Temperature, DecayRate);

% Generate a range for temperature and calculate the model decay rate
TempRange_NLR = linspace(min(Temperature), max(Temperature), 400);
DecayRateModel = optimizedParams(1) * optimizedParams(2) .^ (TempRange_NLR - 20);
DecayRateAt17 = optimizedParams(1) * optimizedParams(2) .^ (17 - 20);

%% Plot Results
% Create a figure to display the data
figure
plot(Temperature, DecayRate, 'ko', 'MarkerFaceColor', 'k')
hold on
plot(TempRange, PredictedDecay, 'r-')
plot(TempRange_NLR, DecayRateModel, 'b--')
plot(17, EstimatedDecayAt17, 'rs', 'MarkerSize', 10)
plot(17, DecayRateAt17, 'bs', 'MarkerSize', 10)
grid on

% Annotate the figure
xlabel('Temperature (°C)')
ylabel('Decay Rate (per day)')
legend('Experimental Data', 'Linearized Fit', 'Non-linear Regression', ...
       'Linear Estimate at 17°C', 'Non-linear Estimate at 17°C', ...
       'Location', 'Best')

