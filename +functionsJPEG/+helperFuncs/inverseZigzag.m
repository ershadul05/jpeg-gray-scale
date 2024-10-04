function block = inverseZigzag(vector)
% inverseZigzag
%   
%   Paramaters:
%      A)inputs:
%             1: vector -> The input 1x64 array/vector
%
%      B)outputs:
%             1: block -> 8x8 block representation of this vector 
%
%   Explanation:-
%               This function takes in an 1x64 array and applies the
%               inverse zigzag transformation on it making it an 8x8 block.
%             
%   Example for a function call: 
%     [B)1:] = zigzag(A)1:)
%       Where,
%     block = inverseZigzag(vector)
%

% Initializations
len = length(vector);
rows = sqrt(len);
j=1; 
sum=1;
block=zeros(rows,rows);

% First Half
for iteration = 1:rows
   sum = sum+1;
    for i=1:iteration
        if rem(iteration,2)==0 %even
            block(i,sum-i) = vector(1,j);
        else
            block(sum-i,i) = vector(1,j);
        end
        j=j+1;
    end
end

% Second Half
for iteration = rows-1:-1:1
  sum = sum+1;
    for i=1:iteration
        if rem(iteration,2)==0 %even
            block(i+sum-(rows+1),sum-(i+sum-(rows+1)))= vector(1,j);
        else
            block(sum-(i+sum-(rows+1)),i+sum-(rows+1)) = vector(1,j);
        end
        j=j+1;
    end
end
end