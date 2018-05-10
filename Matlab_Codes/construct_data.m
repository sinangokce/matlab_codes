function[data] = construct_data()
fout = fopen('Data.csv', 'wt');
in_filenames = {'aps_failure_training_set_processed_8bit.csv', 'aps_failure_test_set_processed_8bit.csv'};
for K = 1 : length(in_filenames)
  thisfile = in_filenames{K};
  fin = fopen(thisfile, 'rt');
  while true
    thisline = fgetl(fin);
    if ~ischar(thisline); break; end   %end of file
    if ~isempty(thisline)  %assume empty lines are trailing empty lines
      fprintf(fout, '%s\n', thisline);
    end
  end
  fclose(fin);
end
fclose(fout);
data = 