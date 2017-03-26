clc;clear;
%train_small = load('train_small_2.txt');
train_small = load('train_small.txt');
%初始化我们的数据，得到train_matrix和test_matrix。
[test_matrix,train_matrix] = initial(train_small);
%得到dev矩阵和slope_data矩阵，其中slope_data矩阵是1列为item_i，2列为item_j，3列为user。
[dev,slope_data] = get_dev_matrix(train_matrix);
%通过得到的dev矩阵，进行数据的处理
[score_matrix] = get_score(test_matrix,train_matrix,dev);
%得到RMES
[rmes] = get_RMES(score_matrix,test_matrix);
