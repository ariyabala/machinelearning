function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

%Sigmoid function g(z) = 1/(1+e^-z)

g = 1./(1+exp(-z))

% Verify using
% run sigmoid.m
% sigmoid(4)
% a=[2 3]
% sigmoid(a)
% =============================================================

end
