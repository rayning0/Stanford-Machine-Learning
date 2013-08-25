function J = costfunctionJ(X, y, theta)

% X is "design matrix" with our training examples
% y is the class labels

m = size(X, 1);   % number of training examples
predictions = X * theta;  % predictions of hypothesis on all m examples. m x 1 array
    
% squared sqrErrors. Dot means element-by-element operation. Each element is in array is squared
sqrErrors = (predictions - y).^2  % this is an m x 1 array

J = 1/(2 * m) * sum(sqrErrors);   % sum() adds up all columns in array. J is a scalar.
