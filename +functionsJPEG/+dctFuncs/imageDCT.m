function [img_frequency] = imageDCT(img,bases)
% imageDCT
%   
%   Paramaters:
%      A)inputs:
%             1: img -> The input image
%             2: bases -> The DCT bases functions used
%
%      B)outputs:
%             1: img_frequency -> frequency domain representation of the
%             image after using DCT.
%
%   Explanation:-
%               This function takes in an image that is divisible by 8
%               and a cell array of bases function calculated beforehand 
%               using calculate Basis function and returns the frequency 
%               domain representation of the image after DCT was applied.
%               
%   Example for a function call: 
%     [B)1:] = imageDCT(A)1:,A)2:)
%       Where,
%     [img_frequency] = imageDCT(img,bases)
%

% Get the rows and cols of our image
[rows,cols] = size(img);

% Pre-allocate an array of zeros to store the image DCT output inside
img_frequency = zeros(size(img));

for i_row=1:rows/8
    
    for j_col=1:cols/8
       
       % Calculate index for current row and col start positions
       current_row_start = 8*(i_row-1)+1;
       current_col_start = 8*(j_col-1)+1;
       
       % Get the 8x8 block corresponding to these indices
       block = img(current_row_start:current_row_start+7,   ...
                   current_col_start:current_col_start+7); 
       
       % Transform to double format
       block = double(block); 
       
       % Apply the discrete cosine transformation on that block (blockDCT)
       block_frequency_domain= functionsJPEG.dctFuncs.blockDCT(block,bases);
       
       % Store that block in the output array
       img_frequency(current_row_start:current_row_start+7,  ...
                     current_col_start:current_col_start+7)  ...
                     = block_frequency_domain;
    end
end

end