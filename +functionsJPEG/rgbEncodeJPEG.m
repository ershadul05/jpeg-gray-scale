function [encoded_image, dictionary, img_size] = rgbEncodeJPEG(image,Q)

% Transform the loaded image into YCBCR
imgYCBCR = rgb2ycbcr(image);

% Downsample the unneeded information
imgYCBCR(:,:,2) = 2*round(imgYCBCR(:,:,2)/2);
imgYCBCR(:,:,3) = 2*round(imgYCBCR(:,:,3)/2);

% Turn it back to RGB format
img_rgb = ycbcr2rgb(imgYCBCR);

[encoded_image_R, dictionary_R, img_size] = ...
functionsJPEG.encodeJPEG(img_rgb(:,:,1),Q);

[encoded_image_G, dictionary_G, ~] = ...
functionsJPEG.encodeJPEG(img_rgb(:,:,2),Q);

[encoded_image_B, dictionary_B, ~] = ...
functionsJPEG.encodeJPEG(img_rgb(:,:,3),Q);

encoded_image = {encoded_image_R , encoded_image_G, encoded_image_B};

dictionary = {dictionary_R, dictionary_G, dictionary_B};

end


