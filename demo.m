% DESCRIPTION
% Visualize decision boundaries of SVDD (libsvm-3.23)

clc
close all
addpath(genpath(pwd))

[traindata, testdata, trainlabel, testlabel] = prepareData;

c = 0.8;  % trade-off parameter
g = 1/16; % kernel width

% Train SVDD hypersphere
cmd = ['-s 5 -t 2 ', '-c ', num2str(c), ' -g ', num2str(g), ' -q'];
model = libsvmtrain(trainlabel, traindata, cmd);

% Predict testing data
[predictedlabel_test, acc, ~] = libsvmpredict(testlabel,testdata, model); 

% Decision Boundary
[rho, X1, X2]  = decision_boundary(model, traindata);

% Visualization
para = [c, g, acc(1)];
visualization(model, traindata, testdata, rho, X1, X2, para)





