function [words] = generateHuffmanTable(probabilities)
% generateHuffmanTable
%   
%   Paramaters:
%      A)inputs:
%             1: probabilities -> 2D cell array input of
%             Symbols/Probabilities 
%
%      B)outputs:
%             1: words -> a 2D-cell array of 3 columns:
%              The 1st column represents the symbols sorted descendingly
%              accrording to the probabilities in column 2.
%              The 2nd column represents probability of a given symbol. 
%              The 3rd column represents the corresponging binary
%              representation using huffman encoding algorithm.
%
%   Explanation:-
%               This function takes a 2D cell array containing the
%               symbol/probability pairs and returns a huffman dictionary
%               (2D cell array) of 3 columns.
%             
%   Example for a function call: 
%     [B)1:] = generateHuffmanTable(A)1:)
%       Where,
%     [words] = generateHuffmanTable(probabilities)
%

len = length(probabilities);

% Initialize the 2D-3 column output cell
words = cell(len,3);

% Get probabilities as a matrix
probabilitiesTemp = cell2mat(probabilities(:,2));

% Store the probabilities in words
words(:,1) = probabilities(:,1);

% Transpose the probabilities and turn them from num to cell
words(:,2) = num2cell(probabilitiesTemp');

% Sort the rows decendingly
words = sortrows(words,[2],'descend');
words(end-1,3) = num2cell(0); words(end,3) = num2cell(1);
temp = words(:,2:3);
temp(:,2) = num2cell(linspace(1,len,len))';

times = len-2;

for i=1:times
new_temp = cell(len-i,2);
new_temp(1:end-1,1:2) = temp(1:end-2,1:2);
new_temp{end,1} = temp{end-1,1}+temp{end,1};
new_temp{end,2} = cat(2,temp{end-1,2},temp{end,2});
temp = new_temp;
temp = sortrows(temp,[1],'descend');

 for j=0:1
   index = length(temp{end-j,2});
   for i=1:index
     words{temp{end-j,2}(i),3} = cat(2,j,words{temp{end-j,2}(i),3});
   end  
 end
   
end

end