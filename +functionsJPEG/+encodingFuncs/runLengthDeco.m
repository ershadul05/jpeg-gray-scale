function img_output = runLengthDeco(vector,new_size)
% runLengthDeco
%   
%   Paramaters:
%      A)inputs:
%             1: block -> The input 8x8 block
%
%      B)outputs:
%             1: img_output -> The output 2D matrix after run length  
%             decoding and 1D to 2D inverse zigzag transformation.
%
%   Explanation:-
%               This function takes in vector and the image size that we
%               want and then runs the inverse run length encoding on it
%               and then applies inverse zigzag to turn it into 8x8 blocks
%               then contatenates it back into an image.
%             
%   Example for a function call: 
%     [B)1:] = runLengthDeco(A)1:)
%       Where,
%     img_output = runLengthDeco(vector,new_size)
%

len = length(vector);
out = []; i=1;

% Run Length decoding
while i<=len
    if vector(i)==0 
        out = [out zeros(1,vector(i+1))];
        i = i + 2;
    else
        out = [out vector(i)];
        i=i+1;
    end
end
   
% Inverse zigzag transform
rows = new_size(1);
cols = new_size(2);
img_output = zeros(new_size);
i = 1;

for i_row=1:rows/8
    
    for j_col=1:cols/8
        
        % Calculate index for current row and col start positions
        current_row_start = 8*(i_row-1)+1;
        current_col_start = 8*(j_col-1)+1;
        
        % Temporary variable to hold 1x64 data at a time
        temp= out(i:i+63);
        
        % Apply zigzag to turn the 1x64 data to 8x8 data
        temp_2D = functionsJPEG.helperFuncs.inverseZigzag(temp);
        
        % Store it again in the output array
        img_output(current_row_start:current_row_start+7, ...
                   current_col_start:current_col_start+7) ...
                   = temp_2D;
        i = i+64;
    end
end
end