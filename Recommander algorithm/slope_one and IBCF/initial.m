function [test_matrix,train_matrix] = initial(train_small)
%初始化矩阵，我们采用的是1/5的为测试集，总的是训练集。
[row,col] = size(train_small);
%将数据变为user-items的矩阵
train_length = ceil(1*row/5);
for i=1: row
    train_matrix(train_small(i,1),train_small(i,2)) = train_small(i,3);
end
for i=1: train_length
    t = ceil(rand() * row);
    test_matrix(train_small(t,1),train_small(t,2)) = train_small(t,3);
end