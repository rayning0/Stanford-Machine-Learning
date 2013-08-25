function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));    % mu = [0 0]  
sigma = zeros(1, size(X, 2)); % sigma = [0 0]

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by its standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       

mu = mean(X);   % 1 row array with means of each column (feature)
sigma = std(X); % 1 row array with std of each column (feature)

X_norm = bsxfun(@minus, X, mu);   % subtract mean from each respective item in X. bsxfun expands 1 row array to match X size
X_norm = bsxfun(@rdivide, X_norm, sigma); % divide each item of previous matrix by standard deviation. rdivide means X_norm/sigma


% ============================================================

end
