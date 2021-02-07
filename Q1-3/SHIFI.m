function ve = SHIFI(A , n , p , itera , va)

%% Function explaination
% this function is running the program for finding all the eigenvectors of
% matrix A through the knwon eigenvalues

% Function Variable Inputs:
% A     %Input matrix
% n     %Matrix dimension
% p     %Eigenvector dimension
% itera %Maximum iteration timing
% valu  %Eigenvalue generating matrix

% Function Variable Output:
% vetr  %Eigenvector



%% Function settings
% Shift Inverse Iteration calculation loop

ve = ones (n , p);                         %initial eigenvector unit matrix

tr = 1e-7;                                   %loop judgement tolerance

for i = 1 : p
    %i-th time calculating range
    A1 = (A - (va(i , i) + 2e-4)*eye(n,n))^-1;          %first matrix of generating segma = 2e-4
    
    for k = 1 : itera
        yk = A1 * ve(: , i);                             %the output eigevector value through shift
        yk = yk / norm(yk);                                  %next step y-value define
        er = norm(yk - ve(:,i));                         %eigevector error caluclation eige(:,i)-perdict
        ve(: , i) = yk;
        
        if er < tr
            %error smaller than tolerance
            break
            %print out the if-loop stop
        end
    end
end

% Finish function running
end

        

