function [img] = invertQuantizeWithQ(img,q)
% quantizeWithQ
%   
%   Paramaters:
%      A)inputs:
%             1: img -> The input quantized image
%             2: Q   -> The input 8x8 quantization table
%
%      B)outputs:
%             1: img -> The re-quantized output image 
%
%   Explanation:-
%               This function does the inverse quantization operation and 
%               takes in an image and an 8x8 quantization matrix
%                         
%   Example for a function call: 
%     [B)1:] = invertQuantizeWithQ(A)1:,A)2:)
%       Where,
%     [img] = invertQuantizeWithQ(img,q)
%

[rows,cols] = size(img);
for i_row=1:rows/8
    
    for j_col=1:cols/8
        
        % Calculate index for current row and col start positions
        current_row_start = 8*(i_row-1)+1;
        current_col_start = 8*(j_col-1)+1;
     
        % Temporary variable to hold the 8x8 block currently used
        temp = img(current_row_start:current_row_start+7,   ...
                   current_col_start:current_col_start+7);
        
        % Storing the re-quantized 8x8 block back in img
        img(current_row_start:current_row_start+7,          ...
            current_col_start:current_col_start+7)= q.*temp;          
    end
 end
end

