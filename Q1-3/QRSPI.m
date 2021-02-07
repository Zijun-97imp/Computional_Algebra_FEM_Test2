function [Q , R] = QRSPI(Ak , n)
%% Function explaination

% Function Varibale Inputs:
% Ak      %Tested matrix of M^-1*K
% n       %Dimension of matix

% Function Variable Outputs:
% Q       %Othorgonal matrix
% R       %Upper triangular matrix




%% Function settings
% Function for Q and R generate
%%function with Q and U intial settings
Q = zeros(n , n);
U = zeros(n , n);
U = Ak;            %given value of matrix A

%%Q matrix generate (i = 1 and i = 2 : n)
Q(: , 1) = U(: , 1) / norm(U(: , 1));

for k = 2 : n
    for j = 1 : k-1
        
        U(: , k) = U(: , k) - Ak(: , k)' * Q(: , j) * Q(: , j);
        %U-matrix Q'A = Q'QR = R; U = A = A-A'QQ
        
    end
    
    Q(: , k) = U(: , k) / norm(U(: , k));
    %Qi = (Ui / ||Ui||)-norm number div
    
end


%%R matrix generate through R = Q'A
R = Q' * Ak;                     %Upper tri-matrix QR decomposition
