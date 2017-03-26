clc;clear;
%train_small = load('train_small_2.txt');
train_small = load('train_small.txt');
number = 5;
%初始化我们的数据，得到train_matrix和test_matrix。
[test_matrix,train_matrix] = initial(train_small);
%算出相似性矩阵sim
[sim] = get_sim_matrix(train_matrix);
%找到test_matrix中的数据，并且和sim矩阵中的数据进行比较，找到最相近的用户来预测其值。
[score_matrix] = get_score_matrix(test_matrix,train_matrix,sim,number);
%得到RMES
[rmes] = get_RMES(score_matrix,test_matrix);