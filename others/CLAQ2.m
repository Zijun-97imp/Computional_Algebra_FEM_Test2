%
% calculating the natural frequency through the eige and eiga by the series
% of methods: includinG:
% RQI and HHD
% QRITER
% SSI and RITZ
%
%
%
% Zijun Fang
% CID: 01811420 
% 13 APR 2020
%
%-------------------------------------------------------------------------%
% clear workspace
% 
% setup enviroment
%-------------------------------------------------------------------------%


clear
close all

%% Matrix setup

% Initial settings
n = 4;                      % Dimension of Matrix
iter = input('Iteration Number of Calculating:');


% FE Model Pivoting Matrices
n = 4;
M_e = [.6486, .4151, .02642];
M_d = [3.2525, 2.0868, 1.332, .4709];
K_e = [-4.0024, -2.9024, -2.0932];
K_d = [9.4955, 6.9048, 4.9956, 2.0932];


M_D = sparse(1:n,1:n,ones(1,n).*M_d,n,n);
M_E = sparse(2:n,1:n-1,ones(1,n-1).*M_e,n,n);
K_D = sparse(1:n,1:n,ones(1,n).*K_d,n,n);
K_E = sparse(2:n,1:n-1,ones(1,n-1).*K_e,n,n);

M = M_E + M_D + M_E';
K = K_E + K_D + K_E';

% Define A matrix
A = full((M^-1) * K);       % Original: lam*M*xk = K*xk;

%% Natural Frequency, Eigenvalues and Eigenvectors
% Eigenvalues and Eigenvectors Calculations



















