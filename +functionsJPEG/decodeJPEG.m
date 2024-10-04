function [compressed_image] = ...
decodeJPEG(encoded_image,dictionary,img_size,Q)
% decodeJPEG
%   
%   Paramaters:
%      A)inputs:
%             1: encoded_image -> the input huffman encoded image
%             2: dictionary -> The huffman dictionary of the image
%             3: img_size -> size of image
%             3: Q -> 8x8 Quantization table of choice 
%
%      B)outputs:
%             1: uncompressed_image -> The uncompressed output image 
%
%   Explanation:-
%               This function takes in an image, and undoes the encoding
%               and JPEG compression done on it.
%             
%   Example for a function call: 
%     [B)1:] = encodeJPEG(A)1:,A)2:,A)3:)
%       Where,
%     [uncompressed_image] = decodeJPEG(encoded_image,dictionary,Q)
%

%% Create the DCT basis functions

bases = functionsJPEG.dctFuncs.calculateBases();

%% Huffman decoding

decoded_stream =            ...
functionsJPEG.encodingFuncs.huffmanDeco(encoded_image,dictionary);

%% Apply inverse zigzag transformation & Run length decoding on the blocks

decoded_img_quantized_2D  = ...
functionsJPEG.encodingFuncs.runLengthDeco(decoded_stream,img_size);

%% Inverse Quantization

decoded_img_2D =    ... 
functionsJPEG.helperFuncs.invertQuantizeWithQ(decoded_img_quantized_2D, Q); 

%% Applying the inverse discrete consine transformation

compressed_image = functionsJPEG.dctFuncs.imageIDCT(decoded_img_2D,bases);


end

