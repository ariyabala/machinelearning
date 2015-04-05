function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

[m n] = size(pval)
predictions=zeros(m,n)
pval
epsilon
for(i=1:m)
if(pval(i,:)<epsilon)
predictions(i,:)=1 % setting the prediction to be an anomaly
end
end
predictions
yval

tp=0
fp=0
tn=0
fn=0

for(i=1:m)
% Compute True Positives
if(yval(i,:) == 1 && predictions(i,:) == 1)
fprintf('True positives');
tp=tp+1
end

% Compute True Negatives
if(yval(i,:) == 0 && predictions(i,:) == 0)
fprintf('True negatives');
tn=tn+1
end

% Compute False Positives
if(yval(i,:) == 0 && predictions(i,:) == 1)
fprintf('False positives');
fp=fp+1
end

% Compute False Negatives
if(yval(i,:) == 1 && predictions(i,:) == 0)
fprintf('False negatives');
fn=fn+1
end

end
tp
fp
tn

prec=(tp/(tp+fp))
rec=(tp/(tp+fn))

F1 = (2 * prec * rec)/(prec + rec)




    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
