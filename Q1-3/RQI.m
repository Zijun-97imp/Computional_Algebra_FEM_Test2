function [xk , lam] = RQI (A , n , itera)

%% Function explaination
% the function is calculating the largest eigenvalues MODULUS (lam) and
% eigenvectors (x) of the matrix A
% the first iteration with the Power Iteration (PwI) method Rayleigh 
% Quotient Iteration (RQI), with the x0 as the initial vector


% Function Variables Inputs:
% A     %Input matrix
% n     %Matrix Dimension
% itera %Maximum Iteration Timing    

% Function Variables Outputs:
% x    %Eigenvector
% lam  %Eigenvalue
%% Function settings
% Initial conditions
xk = ones (n , 1);                       %Trail vector
tr = 1e-7;                              %Error Tolerance

% Power Iteration method first 2 rounds
for k = 1 : 2
    x1 = A * xk;                         %Initial x1 product
    lam = norm(x1);
    xk = x1 / lam;                       %Repeat calculation 2nd round
end


% PwI method for RQI
for k = 3 : itera
    
    lam = (xk' * A * xk) / (xk' * xk);         %Eigenvalues from 3rd to iter
    x1 = (A - lam * eye(n)) \ (x1);           %Continuous eigenvecotrs calculations
    er = norm( (A - lam * eye(n)) * xk );  %Define err and Convergence of PwI
    
    % If-loop critise the error limitation
    if er < tr
        break;
    end
end

% Finish function running
end




    
    
