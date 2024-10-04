function [block_spatial] = blockIDCT(block_frequency,bases)
% blockDCT
%   
%   Paramaters:
%      A)inputs:
%             1: block_frequency -> The input 8x8 block in f domain
%             2: bases -> The DCT bases functions used
%
%      B)outputs:
%             1: block_spatial -> spatial domain representation of the
%             block after using IDCT.
%
%   Explanation:-
%               This function takes in an 8x8 block of frequency data and 
%               a cell array containing the bases function calculated 
%               beforehand using calculateBasis function and returns 
%               the spatial domain representation of the block after DCT
%               was applied.
%
%   2D DCT Definition used is:
%   X direction: 1/sqrt(2N) summation from 0 to N-1 F(i,j).*base(i,j)
%   Y direction: 1/sqrt(2N) summation from 0 to N-1 F(i,j).*base(i,j)
%               
%   Example for a function call: 
%     [B)1:] = blockIDCT(A)1:,A)2:)
%       Where,
%     [block_spatial] = blockIDCT(block,bases)
%

% Pre-allocate a zero matrix of size block
block_spatial = zeros(size(block_frequency));
for i=1:8
    
    for j=1:8
        
        % Fetch the 8x8 basis function matrix 
        % corresponding to the cell of pair (i,j)
        base = bases{i,j};
        
        % Multiply the pixels with their corresponding functions and sum
        block_spatial=block_spatial + block_frequency(i,j).*base;   
    end
end

end