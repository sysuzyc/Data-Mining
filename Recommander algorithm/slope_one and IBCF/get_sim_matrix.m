function [sim] = get_sim_matrix(train_matrix)
%µÃµ½ÏàËÆ¾ØÕó
[train_row,train_col] = size(train_matrix);
for i=1:train_row
    for j=1:train_row
        train_x = train_matrix(i,:);
        train_y = train_matrix(j,:);
        train_x = train_x - mean(train_x);
        train_y = train_y - mean(train_y);
        sim(i,j)= (train_x*train_y')/(norm(train_x)*norm(train_y));
    end
end 