function [vector] = zigzag(block)
% zigzag
%   
%   Paramaters:
%      A)inputs:
%             1: block -> The input 8x8 block
%
%      B)outputs:
%             1: vector -> 1x64 vector representation of this block
%
%   Explanation:-
%               This function takes in an 8x8 block and transforms it into
%               a 1x64 array using zigzag.
%             
%   Example for a function call: 
%     [B)1:] = zigzag(A)1:)
%       Where,
%     vector = zigzag(block)
%

% Initializations
[rows,cols] = size(block); 
j = 1; 
sum = 1;
vector = zeros(1,rows*cols);

% Check that block is squared
 if (rows ~= cols) 
    return; 
 end
 
% First Half
for iteration = 1:rows
   sum = sum+1;
    for i=1:iteration
        if rem(iteration,2)==0 %even
            vector(1,j)=block(i,sum-i);
        else
            vector(1,j)=block(sum-i,i);
        end
        j=j+1;
    end
end

% Second Half
for iteration = rows-1:-1:1
  sum = sum+1;
    for i=1:iteration
        if rem(iteration,2)==0 %even
            vector(1,j)=block(i+sum-(rows+1),sum-(i+sum-(rows+1)));
        else
            vector(1,j)=block(sum-(i+sum-(rows+1)),i+sum-(rows+1));
        end
        j=j+1;
    end
end
end