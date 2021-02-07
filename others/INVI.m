function [x , mim] = INVI(A , n , itera)

%% Function explaination
% calculating the smallest eigenvalue of matrix by using Inverse Iteration
% (INVI) required rather thanlargest, using of fact that eigenvalues of 
% A^-1 are reciprocals of thoes A, so smallest value of A is reciprocal of 
% largest

% Function Variables Inputs:
% A     %Input matrix
% n     %Matrix Dimension
% itera %Maximum Iteration Timing  

% Function Variables Outputs:
% x    %Eigenvector
% mim  %Eigenvalue - minimum


%% Function settings
% eigenvector and eigenvalue generate from k = 1:n
x = ones(n , 1);                     %initial eigenvector

for k = 1 : itera
    x1 = mldivide(A , x);            %for the modulus div from initial A(yk)=(xk-1)
    mim = 1 / norm(x1);              %the intial of minimum calculation (xk)min=(yk)/(||yk||inf)
    x = x1 * mim;                    %the continuous looping, unitil converging to 1
end


%Finish function running
end

