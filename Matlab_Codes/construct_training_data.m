function [training_data] = construct_training_data(~)
filename = 'aps_failure_training_set_processed_8bit.csv';
training_data = csvread(filename,1);
