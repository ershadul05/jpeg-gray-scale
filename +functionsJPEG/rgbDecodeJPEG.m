function [compressed_image] = ...
rgbDecodeJPEG(encoded_image,dictionary,img_size,Q)

[compressed_image_R] = ...
functionsJPEG.decodeJPEG(encoded_image{1,1},dictionary{1,1},img_size,Q);

[compressed_image_G] = ...
functionsJPEG.decodeJPEG(encoded_image{1,2},dictionary{1,2},img_size,Q);

[compressed_image_B] = ...
functionsJPEG.decodeJPEG(encoded_image{1,3},dictionary{1,3},img_size,Q);

% Concatenate the three channels together
compressed_image =     ...
cat(3,compressed_image_R,compressed_image_G,compressed_image_B);

end
