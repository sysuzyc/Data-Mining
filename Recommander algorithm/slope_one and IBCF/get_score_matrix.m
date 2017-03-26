function [score_matrix] = get_score_matrix(test_matrix,train_matrix,sim,number)
%通过得到的sim矩阵，找到最相近的用户，然后进行数据的比对，得到最终的score矩阵
[user,item] = find(test_matrix);
[row,col] = size(user);
for i=1:row
    [we,su] = sort(sim(user(i),:),'descend');
    [row_,col_] = size(we);
    count = 0;
    weight = 0;
    sum = 0;
    for j=1:col_
        if ((su(j) ~= user(i)) && (train_matrix(su(j),item(i)) > 0))
            count = count + 1;
            weight = weight + we(j);
            sum = sum + we(j) * train_matrix(su(j),item(i));
            %fprintf('j = %d,i = %d,count = %d\n',j,i,count);
            %fprintf('i = %d,j = %d,su(j) = %d,item = %d \n',i,j,su(j),item(i));
        end
        if (count == number) break;
        end
    end
    score = sum /  weight;
    if score > 5  score = 5; end
    if score < 1; score = 1; end
    score_matrix(user(i),item(i)) = score;
end