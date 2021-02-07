function Si = SENS(n , ki , mi , eige , eiga , E0 , p0)

%% Function explaination
% analysis the sensitive of eigenvalues of the system with respect to the
% changes of the element parameters;
% E0 , p0 are the setting conditions

% Function Variable Inputs:
% n              %Dimension of matrix
% ki             %Elementary stiffness
% mi             %Elementary mass
% eige           %Eigenvector
% eiga           %Eigenvalue
% E0             %Setting Young's Modulus
% p0             %Setting density

% Function Variable Output:
% Si             %Sensitive matrix for i-element output


%% Function settings
% for initial dKdEi function
dKdEi = zeros(n);           %dimension of dKdEi
dKdEi(1:2 , 1:2) = ki / E0; %right upper corner matrix forming for unit stiffness
dMdp0 = zeros(n);           %dimension of dMdp0
dMdp0(1:2 , 1:2) = mi / p0; %right upper corner matrix forming for unit mass

% for SENS looping calculating the difference of eigenvalues
for k = 1:n
    
    Si(k , 1) = eige(: , k)' * dKdEi * eige(: , k);         %{eiga_i}={Si}*{del_a}
    Si(k , 2) = eige(: , k)' * (-eiga(k)) * dMdp0 * eige(: , k);
    
end

% Finish Function Running
end












