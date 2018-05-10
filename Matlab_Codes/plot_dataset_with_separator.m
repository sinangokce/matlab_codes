function [] = plot_dataset_with_separator(data,Mdl)

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

A = Mdl.Coeffs(1,2).Linear(1);
B = Mdl.Coeffs(1,2).Linear(2);
C = Mdl.Coeffs(1,2).Linear(3);
D = Mdl.Coeffs(1,2).Const;

[x, y] = meshgrid(-3:0.1:5);
z = -1/C*(A*x + B*y + D);
surf(x,y,z);
axis normal