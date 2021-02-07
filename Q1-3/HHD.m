function B = HHD(A , n , e)

%% Function explaination
% this function is returning the results of Householder deflation (HHD),
% with providing the first eigenvalues and corresponding eigenvecotrs by
% using the initial condition.

% Function Variables Inputs:
% A           %Input Matrix
% n           %Matrix Dimension
% e           %First eigenvector of A

% Function Variables Output
% B           %HHD function output matrix


%% Function settings
% Initial condition settings
a = norm(e);                  %the constant norm value-alipha of eigenvector matrix
v = zeros(n , 1);             %the initial unit vector perpendicular to hyperplane

% v-vector generation
c = 2 * (a^2) - (2 * a * e(1));                     %initial constant ratio of eigenvector 1
v(1) = sqrt(.5*(1-e(1) / c));          %first unit vector

% for contiue unit vector-v generate from i = 2:n
for i = 2:n
    v(i)= -sign(e(i)) * sqrt(e(i)^2 / c);     %v(i=2:n) continue generate
end

% B and H matrix generation through HHD
H = eye(n) - 2 * v * v';                  %H = [I - 2{v}({v}^H)]
B = H * A * H;                            %orthogonal method matrix
B = B(2:n , 2:n);                         %B matrix update without b11


% Function finish
end

