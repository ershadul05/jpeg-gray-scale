function [img_spatial] = imageIDCT(img_frequency,bases)
% imageDCT
%   
%   Paramaters:
%      A)inputs:
%             1: img_frequency -> The input image in frequency domain
%             2: bases -> The DCT bases functions used
%
%      B)outputs:
%             1: img_spatial_domain -> frequency domain representation of 
%             the image after using DCT.
%             
%   Explanation:-
%               This function takes in an image that is divisible by 8
%               and a cell array of bases function calculated beforehand 
%               using calculate Basis function and returns the spatial 
%               domain representation of the image after IDCT was applied.
%               
%   Example for a function call: 
%     [B)1:] = imageIDCT(A)1:,A)2:)
%       Where,
%     [img_frequency] = imageIDCT(img,bases)
%

% Get the rows and cols of our image
[rows,cols] = size(img_frequency);

% Pre-allocate an array of zeros to store the image IDCT output inside
img_spatial = zeros(size(img_frequency));
for i_row=1:rows/8
    for j_col=1:cols/8
       
       % Calculate index for current row and col start positions
       current_row_start = 8*(i_row-1)+1;
       current_col_start = 8*(j_col-1)+1;
       
       % Get the 8x8 block corresponding to these indices
       block = img_frequency(current_row_start:current_row_start+7, ...
                             current_col_start:current_col_start+7); 
        
       % Apply the inverse discrete cosine transformation on that block
       block_r= functionsJPEG.dctFuncs.blockIDCT(block,bases);
       
       % Store that block in the output array
       img_spatial(current_row_start:current_row_start+7,   ...
                   current_col_start:current_col_start+7)   ...
                   = block_r;
    end
end

end