function [img_output, img_rows, img_cols] = ...
makeImageDimensionsDivisable(img,dim)
% makeImageDimensionsDivisable
%   
%   Paramaters:
%      A)inputs:
%             1: img -> The input image
%             2: dim -> the dimension that we want to make the image
%             divisible by (1 integer).
%
%      B)outputs:
%             1: img_cols   -> The number of cols in the new image
%             2: img_rows   -> The number of rows in the new image
%             3: img_output -> The output image
%
%   Explanation:-
%               This function takes in an image and the value that we want
%               to make our image columns and rows divisible by and returns
%               a new image that is divisible by that value.               
%
%   Example for a function call: 
%  [B)3:,B)2:,B)1:] = makeImageDimensionsDivisable(A)1:,A)2:)
%       Where,
%  [img_output, img_rows, img_cols] = makeImageDimensionsDivisable(img,dim)
%

img_rows = size(img,1); img_cols = size(img,2);

rems = rem(size(img),dim);
if rems(1) ~= 0
    img_rows = img_rows + dim - rems(1);
end
if rems(2) ~= 0
    img_cols = img_cols + dim - rems(2);
end
img_output = zeros(img_rows, img_cols);

img_output(1:size(img,1),1:size(img,2)) = img;
end