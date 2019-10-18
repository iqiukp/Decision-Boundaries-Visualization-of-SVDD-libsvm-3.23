function [traindata, testdata, trainlabel, testlabel] = prepareData
%{ 
% DESCRIPTION
Prepare the data for SVDD_WOA

      [traindata, testdata, trainlabel, testlabel] = prepareData

OUTPUT
  traindata           Training data
  testdata            Testing data
  trainlabel          Training label
  trainlabel          Training label

Created on 18th October 2019, by Kepeng Qiu.
-------------------------------------------------------------%
%} 

load .\data\banana.mat

traindata(:, 1) = banana(1:2:500, 1);
traindata(:, 2) = banana(1:2:500, 2);

testdata(:, 1) = banana(501:2:1000, 1);
testdata(:, 2) = banana(501:2:1000, 2);

trainlabel = ones(size(traindata, 1), 1);
testlabel = -ones(size(testdata, 1), 1);
end