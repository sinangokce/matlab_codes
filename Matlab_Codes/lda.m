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
%% Partition dataset
%% %%%%%%%%%%%%%
n = [15000; 20000; 30000; 45000; 60000; size(data,1)];

%% F_Fold Cross-Validation
%% %%%%%%%%%%%%%%

    for i=1:F_fold
        %sample_size = n(j);
        [training_data, test_data] = split_dataset_sinan(data(1:15000,:),tt_ratio);
        Model = fitcdiscr(training_data(:,2:M), training_data(:,1));%train the model with training data
        [label(:,i),score(:,:,i),cost(:,:,i)] = predict(Model,test_data(:,2:M));
        L(i) = loss(Model,test_data(:,2:M), test_data(:,1));
        B_Index(i) = b_index(score(:,:,i), test_data(:,1));
        %x = 1:1:10;
        %figure();
        %plot(x,B_Index(i));
        %title(['Sample size = ' num2str(sample_size)]);
    end
clear label;
clear score;
clear cost;
clear L;
x = 1:1:10;
figure();
plot(x,B_Index);
title('Sample size = 15000');  
clear B_Index;
    
for i=1:F_fold
        [training_data, test_data] = split_dataset_sinan(data(1:25000,:),tt_ratio);
        Model = fitcdiscr(training_data(:,2:M), training_data(:,1));%train the model with training data
        [label(:,i),score(:,:,i),cost(:,:,i)] = predict(Model,test_data(:,2:M));
        L(i) = loss(Model,test_data(:,2:M), test_data(:,1));
        B_Index(i) = b_index(score(:,:,i), test_data(:,1));
end 
clear label;
clear score;
clear cost;
clear L;

x = 1:1:10;
figure();
plot(x,B_Index);
title('Sample size = 20000');
clear B_Index;

for i=1:F_fold
        [training_data, test_data] = split_dataset_sinan(data(1:30000,:),tt_ratio);
        Model = fitcdiscr(training_data(:,2:M), training_data(:,1));%train the model with training data
        [label(:,i),score(:,:,i),cost(:,:,i)] = predict(Model,test_data(:,2:M));
        L(i) = loss(Model,test_data(:,2:M), test_data(:,1));
        B_Index(i) = b_index(score(:,:,i), test_data(:,1));
end 
clear label;
clear score;
clear cost;
clear L;

x = 1:1:10;
figure();
plot(x,B_Index);
title('Sample size = 30000');
clear B_Index;

for i=1:F_fold
        [training_data, test_data] = split_dataset_sinan(data(1:45000,:),tt_ratio);
        Model = fitcdiscr(training_data(:,2:M), training_data(:,1));%train the model with training data
        [label(:,i),score(:,:,i),cost(:,:,i)] = predict(Model,test_data(:,2:M));
        L(i) = loss(Model,test_data(:,2:M), test_data(:,1));
        B_Index(i) = b_index(score(:,:,i), test_data(:,1));
end 
clear label;
clear score;
clear cost;
clear L;
x = 1:1:10;
figure();
plot(x,B_Index);
title('Sample size = 45000');
clear B_Index;

for i=1:F_fold
        [training_data, test_data] = split_dataset_sinan(data(1:60000,:),tt_ratio);
        Model = fitcdiscr(training_data(:,2:M), training_data(:,1));%train the model with training data
        [label(:,i),score(:,:,i),cost(:,:,i)] = predict(Model,test_data(:,2:M));
        L(i) = loss(Model,test_data(:,2:M), test_data(:,1));
        B_Index(i) = b_index(score(:,:,i), test_data(:,1));
end 
clear label;
clear score;
clear cost;
clear L;
x = 1:1:10;
figure();
plot(x,B_Index);
title('Sample size = 60000');
clear B_Index;

for i=1:F_fold
        [training_data, test_data] = split_dataset_sinan(data(1:size(data,1),:),tt_ratio);
        Model = fitcdiscr(training_data(:,2:M), training_data(:,1));%train the model with training data
        [label(:,i),score(:,:,i),cost(:,:,i)] = predict(Model,test_data(:,2:M));
        L(i) = loss(Model,test_data(:,2:M), test_data(:,1));
        B_Index(i) = b_index(score(:,:,i), test_data(:,1));
end 
clear label;
clear score;
clear cost;
clear L;

x = 1:1:10;
figure();
plot(x,B_Index);
title(['Sample size = ' num2str(size(data,1))]);
clear B_Index;


