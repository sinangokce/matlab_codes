function [test_data] = construct_test_data(~)
filename = 'aps_failure_test_set_processed_8bit.csv';
test_data = csvread(filename,1);
