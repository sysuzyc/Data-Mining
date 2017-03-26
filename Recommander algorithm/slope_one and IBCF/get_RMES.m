function [rmes] = get_RMES(score_matrix,test_matrix)
%对两个矩阵进行比较，得到RMES。
[row_2,col_2] = size(score_matrix);
rmes = 0;
count = 0;
for i=1:row_2
    for j=1:col_2
        if ((score_matrix(i,j) > 0) && (test_matrix(i,j) > 0))
        rmes = rmes + (score_matrix(i,j) - test_matrix(i,j))^2;
        count = count + 1;
        end
    end
end
rmes = rmes / count;
fprintf('RMES = %f\n',rmes);