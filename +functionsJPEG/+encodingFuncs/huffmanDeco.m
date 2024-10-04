function [stream] = huffmanDeco(bits_stream,dictionary)
% huffmanDeco
%   
%   Paramaters:
%      A)inputs:
%             1: bits_stream -> input data containing symbols to be encoded
%             2: dictionary -> 2D cell array of 3 columns (dictionary)
%      
%      B)outputs:
%             1: stream -> The stream of huffman decoded symbols
%
%   Explanation:-
%               This function takes in huffman encoded data and the
%               dictionary that was used to encode it and returns the
%               decoded stream
%             
%   Example for a function call: 
%     [B)1:] = huffmanDeco(A)1:,A)2:)
%       Where,
%     stream = huffmanDeco(bits_stream,dictionary)
%


[rows,~] = size(dictionary);
len = length(bits_stream);
stream=[];
temp_stream=[];

 for i=1:len
   % Temporary variable for storage  
   temp_stream = cat(2,temp_stream,bits_stream(i));
   for j=1:rows
       if isequal(dictionary{j,3},temp_stream)
           % Store the symbol if you find its stream while scanning
           stream = cat(2,stream, dictionary{j,1});
           temp_stream=[];
           continue;
       end
   end
 end
 
end
