function [img_quantized] = quantizeWithQ(img,Q)
% quantizeWithQ
%   
%   Paramaters:
%      A)inputs:
%             1: img -> The input image
%             2: Q   -> The input 8x8 quantization table
%
%      B)outputs:
%             1: img_quantized -> The output image quantized by Q
%
%   Explanation:-
%               This function takes in an image and an 8x8 quantization
%               matrix and returns an image quantized by that matrix
%             
%   Example for a function call: 
%     [B)1:] = quantizeWithQ(A)1:,A)2:)
%       Where,
%     [img_quantized] = quantizeWithQ(img,Q)
%

% Get the rows and cols of our image
[rows,cols] = size(img);

% Pre-allocate an array of zeros to store the quantized image output inside
img_quantized = zeros(size(img));
for i_row=1:rows/8
    
    for j_col=1:cols/8
       
       % Calculate index for current row and col start positions 
       current_row_start = 8*(i_row-1)+1; 
       current_col_start = 8*(j_col-1)+1;
       
       % Get the 8x8 block corresponding to these indices
       block = img(current_row_start:current_row_start+7,   ...
                   current_col_start:current_col_start+7); 
       
       % Quantize the block by Q
       block_q= block./Q;
       
       % Store that block in the output array
       img_quantized(current_row_start:current_row_start+7, ...
                     current_col_start:current_col_start+7) ...
                     = block_q;
    end
end
    % Round the output and store it in the array
    img_quantized = round(img_quantized);
end