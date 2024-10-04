function [encoded_image, dictionary, img_size] = encodeJPEG(image,Q)
% encodeJPEG
%   
%   Paramaters:
%      A)inputs:
%             1: image -> the input image to be compressed
%             2: Q -> 8x8 Quantization table of choice               
%
%      B)outputs:
%             1: dictionary    -> The huffman dictionary of the image
%             2: encoded_image -> The compressed and encoded image
%             3: img_size      -> size of the image after padding
%
%   Explanation:-
%               This function takes in an image, compresses it and returns
%               the encoded image and its dictionary.
%             
%   Example for a function call: 
%     [B)2:,B)1:] = encodeJPEG(A)1:,A)2:)
%       Where,
%     [encoded_image, dictionary] = encodeJPEG(image,Q)
%

%% Create the DCT basis functions

bases = functionsJPEG.dctFuncs.calculateBases();

%% Get the grayscale image

% convert to grayscale image
% OLD LINE -> image = double(rgb2gray(image)); 
image = double(image); 

%% Padding the image to make its rows and columns divisible by 8

[image, rows, cols] = ...
functionsJPEG.helperFuncs.makeImageDimensionsDivisable(image,8);

%% Applying the discreet consine transformation on the padded image

image_frequency_domain = functionsJPEG.dctFuncs.imageDCT(image,bases);

%% Quantization

image_quantized = ...
functionsJPEG.helperFuncs.quantizeWithQ(image_frequency_domain,Q);

%% Apply zigzag transformation and Run length encoding on the blocks

quantized_img_1D = [];
for i_row = 1:rows/8

    for j_col = 1:cols/8
       
       % Calculate index for current row and col start positions
       current_row = 8*(i_row-1)+1; 
       current_col = 8*(j_col-1)+1;
       block = image_quantized(                            ...
                               current_row:current_row+7,  ...
                               current_col:current_col+7   ...
                               ); 
       block_1D = functionsJPEG.encodingFuncs.runLengthEnco(block);
       quantized_img_1D = [quantized_img_1D block_1D];
       
    end
end

%% Huffman encoding

 probabilities =      ...
 functionsJPEG.helperFuncs.getProbabilities(quantized_img_1D);
 
 dictionary =         ...
 functionsJPEG.encodingFuncs.generateHuffmanTable(probabilities);
 
 encoded_bit_stream = ...
 functionsJPEG.encodingFuncs.huffmanEnco(quantized_img_1D,dictionary);
 
 encoded_image = encoded_bit_stream;
 
 img_size = [rows cols];

end

