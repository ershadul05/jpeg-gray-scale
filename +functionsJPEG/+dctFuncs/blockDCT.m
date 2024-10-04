function [block_frequency]= blockDCT(block,bases)
% blockDCT
%   
%   Paramaters:
%      A)inputs:
%             1: block -> The input 8x8 block
%             2: bases -> The DCT bases functions used
%
%      B)outputs:
%             1: block_frequency -> frequency domain representation of the
%             block after using DCT.
%
%   Explanation:-
%               This function takes in an 8x8 block and a cell array 
%               containing the bases function calculated beforehand 
%               using calculateBasis function and returns the frequency 
%               domain representation of the block after DCT was applied.
%
%   2D DCT Definition used is:
%   X direction: 1/sqrt(2N) summation from 0 to N-1 pixel(i,j).*base(i,j)
%   Y direction: 1/sqrt(2N) summation from 0 to N-1 pixel(i,j).*base(i,j)
%               
%   Example for a function call: 
%     [B)1:] = blockDCT(A)1:,A)2:)
%       Where,
%     [img_frequency] = blockDCT(block,bases)
%

% Pre-allocate a zero matrix of size block
block_frequency = zeros(size(block));
for i=1:8
    
    for j=1:8
        
        % Fetch the 8x8 basis function matrix 
        % corresponding to the cell of pair (i,j)
        base = bases{i,j};
        
        % Multiply the pixels with their corresponding functions and sum
        block_frequency(i,j)=sum(block.*base,'all');  
    end
end

% Divide by 2N and 2 to complete the equation
block_frequency=block_frequency/16;
block_frequency(1,:)=block_frequency(1,:)/2;
block_frequency(:,1)=block_frequency(:,1)/2;

end