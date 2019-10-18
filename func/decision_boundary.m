function [rho, X1, X2] = decision_boundary(model, traindata)

%{ 
% DESCRIPTION
Computation of decision boundary

      [rho, X1, X2] = decision_boundary(model, traindata)

INPUT
  model        SVDD model
               N: number of samples
  traindata    Training data


OUTPUT
  rho                 Bias term
  X1, X2              Grid range

Created on 18th October 2019, by Kepeng Qiu.
-------------------------------------------------------------%
%} 

% Compute the range of grid 
x1_range = grid_range(traindata(:, 1));
x2_range = grid_range(traindata(:, 2));

% grid 
[X1, X2] = meshgrid(x1_range, x2_range);
X_Grid = [X1(:), X2(:)];

% the grid label is only for the input of the function 'libsvmpredict'
grid_label = ones(size(X_Grid, 1), 1);

% Predict the label of each grid point
[~, ~, rho_0] = libsvmpredict(grid_label, X_Grid, model);
rho = reshape(rho_0, size(X1, 1), size(X1, 2));
end
