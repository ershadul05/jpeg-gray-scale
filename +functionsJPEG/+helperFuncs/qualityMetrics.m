function [space_saving,compression_ratio,ms_error,peak_snr] = ...
qualityMetrics(uncompressed_image, encoded_image, compressed_image)

uncompressed_image = double(uncompressed_image);

uncompressed_image_size = (8*numel(uncompressed_image));

if(isa(encoded_image,'cell'))
    compressed_image_size = length(cell2mat(encoded_image));
else
    compressed_image_size = length(encoded_image);
end

peak_sig_noise_ratio = ...
psnr(uint8(compressed_image),uint8(uncompressed_image))

peak_snr = peak_sig_noise_ratio;

ms_error = immse(uint8(compressed_image),uint8(uncompressed_image))

rms_error = sqrt(ms_error)

compression_ratio = (uncompressed_image_size/compressed_image_size)

space_saving_percentage =   ...
(1-(compressed_image_size/uncompressed_image_size))*100

space_saving = space_saving_percentage;
end

