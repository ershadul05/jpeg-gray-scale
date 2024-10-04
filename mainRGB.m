%% Demo main file for RGB 

clear; 
clc;
close all;


%% Read the image in

image = imread('Neo.jpg');

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

%% Encode the RGB image using JPEG and Q

[encoded_Neo_RGB_Q, dictionary_Neo_RGB_Q, img_size_Neo_RGB_Q] = ...
functionsJPEG.rgbEncodeJPEG(image,Q);

%% Decode the RGB image using JPEG and Q

[compressed_image_Neo_RGB_Q] = ...
functionsJPEG.rgbDecodeJPEG(                         ...
                            encoded_Neo_RGB_Q,       ...
                            dictionary_Neo_RGB_Q,    ...
                            img_size_Neo_RGB_Q,      ...
                            Q);

%% Encode the RGB image using JPEG and Q1

[encoded_Neo_RGB_Q1, dictionary_Neo_RGB_Q1, img_size_Neo_RGB_Q1] = ...
functionsJPEG.rgbEncodeJPEG(image,Q1);

%% Decode the RGB image using JPEG and Q1

[compressed_image_Neo_RGB_Q1] = ...
functionsJPEG.rgbDecodeJPEG(                          ...
                            encoded_Neo_RGB_Q1,       ...
                            dictionary_Neo_RGB_Q1,    ...
                            img_size_Neo_RGB_Q1,      ...
                            Q1);
%% Padding the orignal image

image_div_R = ...
functionsJPEG.helperFuncs.makeImageDimensionsDivisable(image(:,:,1),8);
image_div_G = ...
functionsJPEG.helperFuncs.makeImageDimensionsDivisable(image(:,:,2),8);
image_div_B = ...
functionsJPEG.helperFuncs.makeImageDimensionsDivisable(image(:,:,3),8);

image_div = cat(3,image_div_R,image_div_G,image_div_B);
                        
%% Quality metrics Q

[space_saving_Q,compression_ratio_Q,ms_error_Q,peak_snr_Q] =           ...
functionsJPEG.helperFuncs.qualityMetrics(image_div,                    ...
                                         encoded_Neo_RGB_Q,            ...
                                         compressed_image_Neo_RGB_Q);  ...

%% Quality metrics Q1

[space_saving_Q1,compression_ratio_Q1,ms_error_Q1,peak_snr_Q1] =       ...
functionsJPEG.helperFuncs.qualityMetrics(image_div,                    ...
                                         encoded_Neo_RGB_Q1,           ...
                                         compressed_image_Neo_RGB_Q1); ...
%% Plotting the results

subplot(1,3,1)
imshow(uint8(image));
title('Original image')
subplot(1,3,2)
imshow(uint8(compressed_image_Neo_RGB_Q));
title(strcat('JPEG compressed image Q',32,num2str(space_saving_Q),'%'))
subplot(1,3,3)
imshow(uint8(compressed_image_Neo_RGB_Q1));
title(strcat('JPEG compressed image Q1',32,num2str(space_saving_Q1),'%'))
shg

%% Export the images for the results section

imwrite(uint8(image), '+images/+RGB/Neo_RGB.jpg')
imwrite(uint8(compressed_image_Neo_RGB_Q), '+images/+RGB/Neo_RGB_Q.jpg');
imwrite(uint8(compressed_image_Neo_RGB_Q1), '+images/+RGB/Neo_RGB_Q1.jpg');
