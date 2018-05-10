function [] = plot_dataset(data)

M = size(data,1);
N = size(data,2);
k = 0;

for i = 1:M
    if (data(i,N) == 0)
        k = k+1;
    end
end

X = data((1:k),1);
Y = data((1:k),2);
Z = data((1:k),3);

scatter3(X,Y,Z);
hold on;

X = data((k+1:M),1);
Y = data((k+1:M),2);
Z = data((k+1:M),3);
scatter3(X,Y,Z);









