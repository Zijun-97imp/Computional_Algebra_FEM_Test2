function [eiga , eige , memo] = QRITER(A , n , itera)

%% Function explaination
% using the orthogonal method to calculate the eigenvalues and eigenvectors
% of matrix A, the continuous calculating through QR method by Ak = Qk * Rk

% QR fractorization and decomposition
% for analysis the QR calculation to the matrix A, with Orthogonal matrix
% (Q) and upper triangular matrix (R)

% Function Variables Inputs:
% A     %Input matrix
% n     %Matrix dimension
% itera %Maximum iteration timing


% Function Variables Outputs:
% eiga        %Eigevalue
% eige        %Eigevector
% memo        %Memory generate


%% Function settings


% Function for QR Iteration
%%initial settings of A (Ak)
Ak = A;
eige = eye(n);                  %initial eigevector
tr = 1e-7;                      %looping continuous tolerance

%%QR iteration
for i = 1 : itera
    [Q , R] = QRSPI(Ak , n);
    
    Ak = R * Q;
    yk = eige * Q;
    er = norm(yk - eige);
    eige = yk;                %continuous y-vector
    if er < tr
        break;
    end
    % if-judge the tolerance limit
end

eiga = diag(Ak)' .* eye(n , n);                  %calculating eigevalues through known eigevectors


%%Using SHIFI-function for finding eigevectors
eige = SHIFI (A , n , n , 5 , eiga);


%%Memory function collection
memo = memoryfunc;
end


