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

n = 4;

% FE Model Pivoting Matrices
M = [3.2525 0.6486 0 0; 0.6486 2.0868 0.4151 0; 0 0.4151 1.3320 0.2642; 0 0 0.2642 0.4709];
K = [9.4955 -4.0024 0 0; -4.0024 6.9048 -2.9024 0; 0 -2.9024 4.9956 -2.0932; 0 0 -2.0932 2.0932];


%% Natural Frequency, Eigenvalues and Eigenvectors
% Eigenvalues and Eigenvectors Calculations
% Using matlab language, calculating eige and eiga directly

tic                              %loop timing start
fprintf('Q1. Output Answers:\n'); %Output results


[eigei , eigai] = eigs(K , M);   %initial eige and eiga values through M,K matrices
for k = 1 : n
    eigei(: , k) = (-sign(eigei(1 , k))) * eigei(: , k) / (norm(eigei(: , k)));
    %continuous looping calcualting next eige and eiga
end

eigai
eigei


TimingRecording1 = toc;          %finish timing


































