function [ data ] = generate_dataset(~)
%% Generate dataset
dim = 3;            % Dimensionality of the dataset
nb_class = 2;
nb_data = 1e3;     % Total number of datapoints
dist = 0.3;         % Class distribution

ndata = [round(nb_data*dist), nb_data-round(nb_data*dist)];


%   Parameters
mu      = [0, 2, 4;
           4, 5, 7];
sigma   = [1, 2, 4;
           1, 2, 3];
skew    = [0.5, 0, 0;
           0.5, 0, 0];
kurt    = 3*ones(nb_class, dim);

data = [];

for i=1:nb_class
    temp=[];
    for j=1:dim
        temp = [temp, pearsrnd(mu(i,j),sigma(i,j),skew(i,j),kurt(i,j),[ndata(i),1])];
    end
    temp(:,j+1) = (i-1)*ones(length(temp(:,1)),1);
    data = [data; temp];
end



clear temp;