function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

     theta = theta - alpha / m * X' * (X * theta - y);  % better! vectorized.

%    temp_theta1 = theta(1) - alpha / m * sum(X * theta - y); % don't change theta(1) too soon. theta(2) depends on old theta(1).
%    theta(2) = theta(2) - alpha / m * sum((X * theta - y) .* X(:,2));
%    theta(1) = temp_theta1;
 
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
 %   fprintf('%f \n', J_history(iter));

end

end
