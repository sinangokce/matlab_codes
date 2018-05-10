function [error] = label_error(Y_est,Y)

M = size(Y_est,1);
k = 0;

for i=1:M
    if Y_est(i) == Y(i)
        k = k+1;
    end
end

error = 1-k/M;
