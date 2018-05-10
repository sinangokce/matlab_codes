%% Linear Discriminant Analysis
%% %%%%%%%%%%%%%
clc;
clear all;
close all;

%% Parameters
%% %%%%%%%%%%%%
tt_ratio = 0.7; %train to test ratio
F_fold = 10;

%% Generate Dataset
%% %%%%%%%%%%%%%
data = generate_dataset(); 
plot_dataset(data); 


%since there is no hyper-parameter in this LDA algorithm, no need to do a grid search.
%err = cvshrink(Mdl)

%% F_Fold Cross-Validation
%% %%%%%%%%%%%%%%
for i=1:F_fold
    [training_data, testing_data] = split_dataset_furkan(data,tt_ratio);
    Mdl = fitcdiscr(training_data(:,1:3), training_data(:,4));
    label(:,i) = predict(Mdl, testing_data(:,1:3));
    classification_error(i) = label_error(label(:,i),testing_data(:,4)); %L(i) ile ayni sey
    %figure;
    %plot_dataset_with_separator(testing_data,Mdl);
    L(i) = loss(Mdl,testing_data(:,1:3), testing_data(:,4));
    Mahal_distance(:,:,i) = mahal(Mdl,testing_data(:,1:3)); 
end
standard = std(L);
