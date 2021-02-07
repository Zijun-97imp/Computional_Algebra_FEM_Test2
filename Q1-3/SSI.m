function [eiga , eige , memo] = SSI(A , M , K , n , p , itera)

%% Function explaination
% using the Subspace Iteration (SSI) method to obtain all the matrices,
% including the eigenvectors and eigenvalues.

% Function Variable Inputs:
% A       %Input matrix
% M,K     %Matrices of mass and stiffness
% n       %Matrix dimension
% p       %Eigenvector dimension
% itera   %Maximum iteration timing

% Function Variable Outputs:
% eiga    %Eigevalue
% eige    %Eigevector
% memo    %Memory generate

%% Function settings
%initial condition settings
xk = eye(n , p);
tr = 1e-7;                   %tolerance of loop

for k = 1: itera
    xk = K^-1 * M * xk;                     %SSI mrthod: K*xk+1 = M*xk
    [xki , D] = RITZ (xk , M , K);        %RITZ-function output
    er = norm (xki - xk);                 %norm number of error
    xk = xki;
    
    if er < tr
        break
    end
end

eiga = D;
% mark the eigevalue as the diagonal matrix-defined previous function


%SHIFI function for all the eigevectors
eige = SHIFI(A , n , p , 5 , eiga);

%Memory function collection
memo = memoryfunc;


%Finish function running
end
