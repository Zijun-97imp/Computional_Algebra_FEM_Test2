%
% Calculating the natural frequency throught the lagrange equation, based
% on the equations in FE method with nodes number in variablity to refine
% the final results.
%
%
% Zijun Fang
% CID: 01811420
% 27TH MAR 2020
%
%-------------------------------------------------------------------------%
% clear workspace
% 
% setup enviroment
%-------------------------------------------------------------------------%


clear
close all

%% Matrix setup
% Element Submatrices 
m1 = [2.2484 1.0087; 1.0087 1.8052];
m2 = [1.4773 .6486; .6486 1.1594];
m3 = [.9273 .4151; .4151 .7410];
m4 = [.5910 .2642; .2642 .4709];

k1 = [5.4931 -5.4931; -5.4931 5.4931];
k2 = [4.0024 -4.0024; -4.0024 4.0024];
k3 = [2.9024 -2.9024; -2.9024 2.9024];
k4 = [2.0932 -2.0932; -2.0932 2.0932];

% FE Model Pivoting Matrices
M = [3.2525 0.6486 0 0; 0.6486 2.0868 0.4151 0; 0 0.4151 1.3320 0.2642; 0 0 0.2642 0.4709];
K = [9.4955 -4.0024 0 0; -4.0024 6.9048 -2.9024 0; 0 -2.9024 4.9956 -2.0932; 0 0 -2.0932 2.0932];


%% Natural Frequency, Eigenvalues and Eigenvectors
% Eigenvalues and Eigenvectors Calculations


























