function [score_matrix] = get_score(test_matrix,train_matrix,dev)
[user,item] = find(test_matrix);
[row,col] = size(user);
for i=1:row
     pos = find(train_matrix(user(i),:));%找到user(i)购买过的东西
     score = 0;
     [row_pos,col_pos] = size(pos);
     for j=1:col_pos
         score = score + train_matrix(user(i),pos(j)) + dev(item(i),pos(j));
     end
     score = score / col_pos;
     if score > 5  score = 5; end
     if score < 1; score = 1; end
     score_matrix(user(i),item(i)) = score;
end