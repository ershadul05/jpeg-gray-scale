function [bits_stream] = huffmanEnco(data,dictionary)
% huffmanEnco
%   
%   Paramaters:
%      A)inputs:
%             1: data -> input data containing symbols to be encoded
%             2: dictionary -> 2D cell array of 3 columns dictionary
%      
%      B)outputs:
%             1: bits_stream -> huffman encoded output bit stream
%
%   Explanation:-
%               This function takes in data and a huffman lookup table
%               (dictionary) and returns a huffman encoded bit stream
%             
%   Example for a function call: 
%     [B)1:] = huffmanEnco(A)1:,A)2:)
%       Where,
%     bits_stream = huffmanEnco(data,dictionary)
%


len = length(data);
bits_stream=[];

for i=1:len
   
   % Store the symbol of the current iteration in symbol
   symbol = data(i);
   
   % Find the index of the current symbol in the dictionary
   index = cell2mat([dictionary(:,1)])==symbol;
   
   % Retrun the corresponding huffman encoded value from the dictionary
   code_word = dictionary{index,3};
   
   % Store this current value in the bitstream and continue till the end
   bits_stream=cat(2,bits_stream,code_word);
end
end