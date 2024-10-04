function [encoded_1D_block] = runLengthEnco(block)
% runLengthEnco
%   
%   Paramaters:
%      A)inputs:
%             1: block -> The input 8x8 block
%
%      B)outputs:
%             1: encoded_block -> The RLE encoded output 1x64 array
%
%   Explanation:-
%               This function takes in an 8x8 block, transforms and
%               transforms it into a 1x64 array using zigzag then it
%               applies run length encoding on it
%             
%   Example for a function call: 
%     [B)1:] = runLengthEnco(A)1:)
%       Where,
%     encoded_block = runLengthEnco(block)
%

% Apply zigzag to turn 8x8 to 1x64
vector = functionsJPEG.helperFuncs.zigzag(block);

% Initializations
len = length(vector);
counter = 0;  
encoded_1D_block = [];
i = 1; 

% Run length Encoding
while i<=len
    if(vector(i) == 0)
        while(vector(i) == 0)
           counter=counter+1;
           i=i+1;
               if(i > len) 
                   % Stopping Condition
                   break;
               end
       end
       encoded_1D_block = [encoded_1D_block 0 counter];
       counter=0;
    else
       encoded_1D_block = [encoded_1D_block vector(i)];
       i=i+1;
    end
end
end