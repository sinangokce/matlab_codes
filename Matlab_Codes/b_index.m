function [B_Index] = b_index(score,Y)
%B_INDEX Calculates the B Index
%
%   input -----------------------------------------------------------------
%   
%       o score        : (N x K), Predicted class posterior probabilities.
%                           N is the number of observations(number of test data samples).
%                           K is the number of classes.
%
%       o Y            : (N x 1), Y is the column vector and each element is the
%                           actual label.
%   output ----------------------------------------------------------------
%
%       o B_Index  : (1 x 1), a scalar which has the calculated B_index.
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = size(Y,1); %number of samples
B_Index = 0;
for i=1:N
    if Y(i)==0
        B_Index = B_Index + ((score(i,1)-1)^2)/N;
    else
        B_Index = B_Index + ((score(i,1)-0)^2)/N;
    end
end
B_Index = 1-B_Index;