function [basis_functions] = calculateBases()
% calculateBasis
%
%   Paramaters:
%      A)outputs:
%             1: basis_functions -> 8x8 cell array of the basis functions 
%             needed for DCT
%            
%   Explanation:-
%              This function returns the basis functions for the DCT
%   
%   2D DCT Definition used is:
%   X direction: summation from 0 to N-1 cos((2x+1)(i-1)*pi/2N)
%   Y direction: summation from 0 to N-1 cos((2y+1)(j-1)*pi/2N)
%   
%   Note:-
%        N = 8 and since MATLAB indices start from 1, we subtract 1.
%
%   Example for a function call: 
%     [A)1:] = calculateBasis();
%       Where,
%     [basis] = calculateBasis();
%

% x and y will help us calculate values from 0~7 in each i,j iteration
x =(0:7); y =(0:7);

% Cell array of size 8x8 to contain the basis functions
basis_functions = cell(8,8);
for i=1:8
    % Calculate the X direction basis function
    basis_x = cos((2*(x)+1)*(i-1)*pi/16);
    for j =1:8
        % Calculate the Y direction basis function
        basis_y = cos((2*(y)+1)*(j-1)*pi/16);
        % Multiply them by each other and store them in the cell array
        basis_functions{i,j}= basis_x'*basis_y;
    end
end
end