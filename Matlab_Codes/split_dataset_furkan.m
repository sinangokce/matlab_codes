function [training_data, testing_data] = split_dataset_furkan(data,tt_ratio)
%% Data Split

class0_size = sum(data(:,1)==0);        % Class sizes
class1_size = size(data,1)-class0_size;

idx0 = randperm(class0_size);
idx1 = randperm(class1_size)+class0_size;

training_data = data([idx0(1:class0_size*tt_ratio) ...
                idx1(1:round(class1_size*tt_ratio))],:);
testing_data = data([idx0(class0_size*tt_ratio+1:class0_size) ...
                idx1(round(class1_size*tt_ratio)+1:class1_size)],:);
            
%save('split_data', 'training_data', 'testing_data');