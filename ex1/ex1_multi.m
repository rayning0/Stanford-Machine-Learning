%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     warmUpExercise.m
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%     gradientDescentMulti.m
%     computeCostMulti.m
%     featureNormalize.m
%     normalEqn.m
%
%  For this part of the exercise, you will need to change some
%  parts of the code below for various experiments (e.g., changing
%  learning rates).
%

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc; clf;

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: By using the 'hold on' command, you can plot multiple
%       graphs on the same figure.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('\nRunning gradient descent ...\n');

% Choose some alpha value
loop = [1.3 1 .3 .1 .03 .01];
num_iters = 50;
J = [];   % matrix of all J values. Each column is J for a different alpha.
for alpha = loop,
  % alpha = 0.01;

  % Init Theta and Run Gradient Descent 
  theta = zeros(3, 1);
  [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);
  J = [J J_history];  % append column of new J values to right of J

% Print predicted price of 1650 sq ft, 3 br home, based on alpha
  price = [1 (([1650 3] - mu) ./ sigma)] * theta; %normalize data and add '1' column to left
  fprintf(["Alpha: %.2f  Predicted price of 1650 sq-ft, 3 br home: $%.2f\n"], alpha, price);

 endfor

fprintf('\nFinal value of J, for different alphas: ');
J(num_iters, :)
[minJ, col] = min(J(num_iters, :));   % minJ = smallest element of (last row) of J. col = column # for this
fprintf(['Smallest J = %f for Alpha = %.2f\n\n'], minJ, loop(col));

% Plot the convergence graph
figure;
plot(1:num_iters, J(:,1), '-', 'LineWidth', 2, 'Color', 'r');

xlabel('Number of iterations');
ylabel('Cost J');

colors = {'','k','b','y','g','m'}; % Cell array of colors

hold on;  % plot all later graphs on this same graph

for i = 2:columns(J),
  plot(1:num_iters, J(:,i), '-', 'LineWidth', 2, 'Color', colors{i});
endfor

loop = strtrim(cellstr(num2str(loop'))');  % converts array of numbers to cell array strings
legend(loop);   % on graph, put legend for each alpha


% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.

% price = [1 (1650 - mu)/sigma (3 - mu)/sigma] * theta; %normalize data and add '1' column to left

% ============================================================

% fprintf(['Predicted price of a 1650 sq-ft, 3 br house (using gradient descent): $%.2f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X. No need to normalize data!
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = [1 1650 3] * theta; 


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%.2f\n'], price);
