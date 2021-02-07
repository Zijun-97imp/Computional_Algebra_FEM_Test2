%
% Making the calculation of sensitivity of eigenvalues of the system with
% the respect to the changes in the elements' parameters (p0 and E0);
% i-the elemental submatrix index
%-------------------------------------------------------------------------%
% Q4. Sensitive test of eigevalues

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
i = 4;                                                % index of submatrices
n = i + 1;

%% set parameters
p0 = 3;
E0 = 4;


%% Matrix Settings
% upper and diagonal matrix forming

m1 = [2.2484 1.0087;1.0087 1.8052];
m2 = [1.4473 0.6486;0.6486 1.1594];
m3 = [0.9273 0.4151;0.4151 0.7410];
m4 = [0.5910 0.2642;0.2642 0.4709];            % elementary submatrices of mass - mi

k1 = [5.4931 -5.4931;-5.4931 5.4931];
k2 = [4.0024 -4.0024;-4.0024 4.0024];
k3 = [2.9024 -2.9024;-2.9024 2.9024];
k4 = [2.0932 -2.0932;-2.0932 2.0932];          % elementary submatrices of stiffness - ki


K_d = [k1(1,1) , k1(2,2)+k2(1,1) , k2(2,2)+k3(1,1) , k3(2,2)+k4(1,1) , k4(2,2)];
M_d = [m1(1,1) , m1(2,2)+m2(1,1) , m2(2,2)+m3(1,1) , m3(2,2)+m4(1,1) , m4(2,2)];
K_u = [k1(1,2) , k2(1,2) , k3(1,2) , k4(1,2)];
M_u = [m1(1,2) , m2(1,2) , m3(1,2) , m4(1,2)]; % upper cornor matrix and diagonal matrix forming by mi and ki


K_D = sparse(1:n , 1:n , ones(1,n).*K_d , n , n);
M_D = sparse(1:n , 1:n , ones(1,n).*M_d , n , n);
K_U = sparse(2:n , 1:n-1 , ones(1,n-1).*K_u , n , n);
M_U = sparse(2:n , 1:n-1 , ones(1,n-1).*M_u , n , n); % dimension expanded by the matrix expand


M_L = M_U';
K_L = K_U';
M = M_U + M_D + M_L;
K = K_U + K_D + K_L;             % orthogonal method of matrix combine: A = U+D+L

A = full(M^(-1)*K);              % vibration natural freq calculation: eiga^2*M*x = K*x


%% Eigenvalues sensitivity testing - i=4

% Matlab language eiges and eigas calculation
[eiges , eigas] = eigs(K , M)
eigas = diag(eigas);          % for diagonal matrix of eigenvalues
Xs = eiges

for k = 1:n
    
    eiges(: , k) = eiges(: , k) / norm(eiges(: , i));
    % norm number calculation by kth iteration of eigenvectors approaching
    
end


% SENS-func using
Si = SENS(n , k1 , m1 , eiges , eigas , E0 , p0)

spy(M ,'k')
k = full(K)
m = full(M)





















