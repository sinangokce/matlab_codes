function [X_train, y_train, X_test, y_test ] = split_dataset_sinan(X,y,tt_ratio)
%% Split dataset

%   sinangokce, 22.04.2018


M = size(X,1);
M_train =round(M * tt_ratio); %number of training element

random_training_indices = randperm(M,M_train);

X_train = X(random_training_indices,:);
y_train = y(random_training_indices,:);

temp_X = X;
temp_y = y;

temp_X(random_training_indices,:) = [];
temp_y(random_training_indices,:) = [];

X_test = temp_X;
y_test = temp_y;

clear temp_X;
clear temp_y;