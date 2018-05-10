function [data] = change_label(data)
M = size(data,1);

for i = 1:M
    if(data(i,1)~=-0.9921875)
        data(i,1) = 1;
    else
        data(i,1) = 0;
    end
end
