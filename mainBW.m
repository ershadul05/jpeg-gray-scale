%% Demo main file for B/W

clear; 
clc;
close all;

%% Read the image in

image = rgb2gray(imread('Neo.jpg'));

%% Quantization tables defined

 Q = [ 1   2   4   8   16  32  64  128;
       2   4   4   8   16  32  64  128;
       4   4   8   16  32  64  128 128;
       8   8   16  32  64  128 128 256;
       16  16  32  64  128 128 256 256;
       32  32  64  128 128 256 256 256;
       64  64  128 128 256 256 256 256;
       128 128 128 256 256 256 256 256
      ];
  
 Q1 = [
      16  11  10  16  24  40  51  61;
      12  12  14  19  26  58  60  55;
      14  13  16  24  40  57  69  56;
      14  17  22  29  51  87  80  62;
      18  22  37  56  68  109 103 77;
      24  35  55  64  81  104 113 92;
      49  64  78  87  103 121 120 101;
      72  92  95  98  112 100 103 99
     ];    

%% JPEG Encoding using Q

[encoded_Neo_BW_Q, dictionary_Neo_BW_Q, img_size_BW_Q] = ...
functionsJPEG.encodeJPEG(image,Q);

%% JPEG Decoding using Q

[decoded_Neo_BW_Q] =                            ...
functionsJPEG.decodeJPEG(                       ...
                        encoded_Neo_BW_Q,       ...
                        dictionary_Neo_BW_Q,    ...
                        img_size_BW_Q,          ...
                        Q);      

%% JPEG Encoding using Q1

[encoded_Neo_BW_Q1, dictionary_Neo_BW_Q1, img_size_BW_Q1] = ...
functionsJPEG.encodeJPEG(image,Q1);

%% JPEG Decoding using Q1

[decoded_Neo_BW_Q1] =                            ...
functionsJPEG.decodeJPEG(encoded_Neo_BW_Q1,      ...
                         dictionary_Neo_BW_Q1,   ...
                         img_size_BW_Q1,         ...
                         Q1                      ...
                         );
%% Padding the original image

image_div = ...
functionsJPEG.helperFuncs.makeImageDimensionsDivisable(image,8);
                 
%% Quality metrics Q

[space_saving_Q,compression_ratio_Q,ms_error_Q,peak_snr_Q] =           ...
functionsJPEG.helperFuncs.qualityMetrics(image_div,                    ...
                                         encoded_Neo_BW_Q,             ...
                                         decoded_Neo_BW_Q);            ...

%% Quality metrics Q1

[space_saving_Q1,compression_ratio_Q1,ms_error_Q1,peak_snr_Q1] =       ...
functionsJPEG.helperFuncs.qualityMetrics(image_div,                    ...
                                         encoded_Neo_BW_Q1,            ...
                                         decoded_Neo_BW_Q1);           ...
%% Plotting the results

subplot(1,3,1)
imshow(uint8(image));
title('Original image')
subplot(1,3,2)
imshow(uint8(decoded_Neo_BW_Q));
title(strcat('JPEG compressed image Q',32,num2str(space_saving_Q),'%'))
subplot(1,3,3)
imshow(uint8(decoded_Neo_BW_Q1));
title(strcat('JPEG compressed image Q1',32,num2str(space_saving_Q1),'%'))
shg

%% Export the images for the results section

imwrite(uint8(image), '+images/+BW/Neo_BW.jpg');
imwrite(uint8(decoded_Neo_BW_Q), '+images/+BW/Neo_BW_Q.jpg');
imwrite(uint8(decoded_Neo_BW_Q1), '+images/+BW/Neo_BW_Q1.jpg');