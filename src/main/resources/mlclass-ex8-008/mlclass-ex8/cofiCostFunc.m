function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

pred= X*Theta'
err= (pred - Y)
err2=err.^2
[m u] = size(R)
sum=0
for(i=1:m)
for(j=1:u)
if(R(i,j) == 1)
sum = sum+err2(i,j)
end
end
end

TReg=0
for(j=1:num_users)
for(f=1:num_features)
TReg=TReg+(Theta(j,f)^2)
end
end

XReg=0
for(i=1:num_movies)
for(f=1:num_features)
XReg=XReg+(X(i,f)^2)
end
end

TReg=(lambda/2)*TReg
XReg=(lambda/2)*XReg

J = (sum/2)+TReg+XReg


for(i=1:num_movies)
idx = find(R(i, :)==1)
Thetatemp = Theta(idx, :)
Ytemp = Y(i, idx)
X_grad(i, :) = ((X(i, :) * Thetatemp' - Ytemp) * Thetatemp) + (lambda*X(i, :))
end

for(i=1:num_movies)
for(j=1:num_users)
if(R(i,j)==1)
 err=(X(i,:) * Theta(j,:)' - Y(i,j)) * X(i,:)
Theta_grad(j,:) = Theta_grad(j,:) + err
end

end
end

for(j=1:num_users)
for(f=1:num_features)
Theta_grad(j,f) = Theta_grad(j,f) + (lambda*Theta(j,f))
end
end

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
