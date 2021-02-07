function [x , mam] = PwI(A , n , itera)

%% Function explaination
% the function is calculating the maximum eigenvalue and its corresponding
% eigenvector of matrix A through the Power Iteration (PwI) method

% Function Variable Inputs:
% A        %Input matrix
% n        %Matrix dimension
% itera     %Maximum iteration timing

% Function Variable Outputs:
% x        %Eigenvector
% mam      %Eigenvalue - maximum

%% Function settings
x = ones(n , 1);

for k = 1 : itera
    xi = A * x;
    mam = norm(x1);
    x = xi / mam;
end

 
% Finish function running
end

