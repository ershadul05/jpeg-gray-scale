function [probability_model] = getProbabilities(data)
% getProbabilities
%   
%   Paramaters:
%      A)inputs:
%             1: data -> the input data that we want to create a
%             probability model for
%
%      B)outputs:
%             1: probability_model -> The probability model of data
%
%   Explanation:-
%               This function takes a data variable in and returns its
%               probability model as a 2D cell array:
%               First column is the symbols.
%               The second column is the corresponding probability of a
%               symbol.
%             
%   Example for a function call: 
%     [B)1:] = getProbabilities(A)1:)
%       Where,
%     probability_model = getProbabilities(data)
%

% Calculate the histogram using hist function
[counts,symbols]=hist(data,unique(data)); 

% Probability = frequency/total_number
probability=counts./length(data);

% Allocate space for the probability model in a 2D cell Nx2
probability_model = cell(length(symbols),2);

% Tabulate the symbols and their corresponding probabilities
for i=1:length(symbols)
 probability_model{i,1} = symbols(i);
 probability_model{i,2} = probability(i);
end

end