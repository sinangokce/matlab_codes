function [training_data, test_data] = split_dataset_sinan(data,tt_ratio)
%% Split dataset

%   sinangokce, 22.04.2018


M = size(data,1);
M_train =round(M * tt_ratio); %number of training element

random_training_indices = randperm(M,M_train);

training_data = data(random_training_indices,:);

temp_data = data;

temp_data(random_training_indices,:) = [];

test_data = temp_data;

clear temp_data;
