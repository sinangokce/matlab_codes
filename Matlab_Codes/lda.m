clc; close all; clear all;
%% Parameters
%% %%%%%%%%%%%%
tt_ratio = 0.7; %train to test ratio
F_fold = 10;
%% Import training dataset
%% %%%%%%%%%%%%%
%training_data = construct_training_data();
%training_data = change_label(training_data);
%M = size(training_data,2);
%N_train = size(training_data,1);

%% Import testing dataset
%% %%%%%%%%%%%%%
%test_data = construct_test_data();
%test_data = change_label(test_data);
%N_test = size(test_data,1);


%% Import total dataset
%% %%%%%%%%%%%%%
%construct_data();
data = csvread('Data.csv',1);
data = change_label(data);
M = size(data,2);


%since there is no hyper-parameter in this LDA algorithm, no need to do a grid search.
%err = cvshrink(Mdl)
%% F_Fold Cross-Validation
%% %%%%%%%%%%%%%%
for i=1:F_fold
    [training_data, test_data] = split_dataset_sinan(data,tt_ratio);
    Model = fitcdiscr(training_data(:,2:M), training_data(:,1));%train the model with training data
    %label(:,i) = predict(Mdl, test_data(:,2:M));
    %label(:,1) = predict(Mdl, test_data(:,2:M));
    [label(i),score(i),cost(i)] = predict(Model,test_data(:,2:M));
    L(i) = loss(Model,test_data(:,2:M), test_data(:,1));
    B_Index(i) = b_index(score, test_data(:,1));
    %classification_error(i) = label_error(label(:,i),test_data(:,1)); %L(i) ile ayni sey
    %classification_error(1) = label_error(label(:,1),test_data(:,1)); %L(i) ile ayni sey
    %figure;
    %plot_dataset_with_separator(testing_data,Mdl);
    %L(1) = loss(Mdl,test_data(:,2:M), test_data(:,1));
    %Mahal_distance(:,:,i) = mahal(Mdl,test_data(:,2:M)); 
    %Mahal_distance(:,:,1) = mahal(Mdl,test_data(:,2:M)); 
end
%standard = std(L);
 

