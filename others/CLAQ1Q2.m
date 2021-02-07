%
% Calculating the eigenvalues and corresponding eigenvectors of matrix A
% (metion later); using the known iteration methods to solve the continuous
% eigevalues by known the initial condition.
%-------------------------------------------------------------------------%
% Q1. Matlab Language
% Q2-a. RQI and HHD iteration 
% Q2-b. QRITER
% Q2-c. SSI and RITZ
%-------------------------------------------------------------------------%
% Q2-d. Storage using of memory record
% Q2-e. Time running
%-------------------------------------------------------------------------%
%
% Zijun Fang
% CID: 01811420
% 18TH APR 2020
%
%-------------------------------------------------------------------------%
% clear workspace
% 
% setup enviroment
%-------------------------------------------------------------------------%
clear;
close all;
clc


%% Initial Settings
n = 4;                                                % Dimension of Matrix
itera = input('Iteration Number of Calculating:');    % Iteration Number: itera

%% Matrix Settings
% upper and diagonal matrix forming
M_u = [0.6486, 0.4151, 0.02642];
M_d = [3.2525, 2.0868, 1.332, 0.4709];
K_u = [-4.0024, -2.9024, -2.0932];
K_d = [9.4955, 6.9048, 4.9956, 2.0932];


K_D = sparse(1:n , 1:n , ones(1,n).*K_d , n , n);
M_D = sparse(1:n , 1:n , ones(1,n).*M_d , n , n);
K_U = sparse(2:n , 1:n-1 , ones(1,n-1).*K_u , n , n);
M_U = sparse(2:n , 1:n-1 , ones(1,n-1).*M_u , n , n);


M_L = M_U';
K_L = K_U';
M = M_U + M_D + M_L;
K = K_U + K_D + K_L;             % orthogonal method of matrix combine: A = U+D+L

A = full(M^(-1)*K);              % vibration natural freq calculation: eiga^2*M*x = K*x

A = A + eye(n)*1e-15;
M = M + eye(n)*1e-15;
K = K + eye(n)*1e-15;            % singular matrix spares form into double mode


%% Question 1-2 Answerings:
% Matlab language calculation

tic

[eigei , eigai , memoi] = eigs(K , M);
for k = 1:n
    eigei(:,k) = -sign(eigei(1,k))*eigei(:,k)/norm(eigei(:,k));    %norm function for eige and eiga calculation loop
end

memoi = memoryfunc;            %Memory function to record storage by the Matlab language

TimeStoppingi = toc;


% RQI and HHD calculation
tic

[eigaRH , eigeRH , memo1]=RQIT(A , n , itera);

TimeStopping1 = toc;


% QR Iteration calculation
tic

[eigaQR , eigeQR , memo2] = QRITER(A , n , itera);

TimeStopping2 = toc;


% Subspace Iteration calculation
tic

[eigaSI , eigeSI , memo3] = SSI(A , M , K , n , n , itera);

TimeStopping3 = toc;


%% Q1-2 Outcomes:
% Eige and Eiga outputs
fprintf(' \nQ1. Natural Frequencies (omega) and Relevant Eigenvectors of the system:\n');
omegas = diag(eigai .^(1/2))'
Xs = eigei
fprintf(' \nQ2a. Rayleigh Quotient Iteration along with Householder deflation:\n');
omeRH = diag(eigaRH .^(1/2))'
Xs_RH = eigeRH
fprintf(' \nQ2b. QR Iteration technique:\n');
omeQR = diag(eigaQR .^(1/2))'
Xs_QR = eigeQR
fprintf(' \nQ2c. SSI and RITZ:\n');
omeSI = diag(eigaSI .^(1/2))'
Xs_SI = eigeSI

% Storage using by different method
fprintf(' \nQ2d. Storage using in the initial matlab language loop: %.0fbs.', memoi);
fprintf(' \nQ2d. Storage using in different function: RQI and HHD: %.0fbites;..QRITER: %.0fbites;\ SSI and RITZ: %.0fbites.', memo1 , memo2 , memo3);

% TimeStopping recording of different software
fprintf('');









