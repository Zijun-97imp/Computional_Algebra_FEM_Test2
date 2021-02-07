function [eiga , eige , memo] = RQIHHD (A , n , itera)

%% Function explaination
% the function is calculating the eigenvalues and eigenvectors, relating to
% the matrix A through the Rayleigh Quotient Iteration (RQI), including
% the power method and Householder Deflection (HHD).

% Function Variables Inputs:
% A    %Input Matrix
% n    %Matrix Dimension
% iter %Maximum Iteration Timing 

% Function Variables Outputs:
% eige    %Eigenvector
% eiga    %Eigenvalue
% memo    %Memory generate


%% Function Settings
% Initial conditions
B = A;
eige = zeros (n , n);                   %initial nth degree eigvector
eiga = zeros (n , n);                   %initial nth degree eigevalue

% Flapping steps of calculating
for m = 0 : n-2
    [vctr , eiga(m+1 , m+1)] = RQI(B , n-m , itera);
    B = HHD(B , n-m , vctr);
end

eiga(n , n) = B(1 , 1);

% Shifted inverse iteration
eige = SHIFI(A , n , n , 5 , eiga);

% Memory calculation
memo = memoryfunc;

end


