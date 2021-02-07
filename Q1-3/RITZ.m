function [qn , Di] = RITZ(xk , M , K)
%% Function explaination
% RITZ Eigenvalues method: qn = xk * Pn

% Function Variable Inputs:
% xk      %Eigevector matrix
% M,K     %Matrices of mass and stiffness


% Function Variable Outputs:
% qn       %Calculating vector with nth-dimension
% Di       %M,K eigenvalues output


%% Function settings
% qn = xk * Pn

Mi = xk' * M * xk;             %intermedia mass matrix through product
Ki = xk' * K * xk;             %intermedia stiffness matrix
[P , Di] = eig(Ki , Mi);       %P for qn-output matrix; Di eigevalue
qn = xk * P;                   %qn-output

return


% Function running finish
end
