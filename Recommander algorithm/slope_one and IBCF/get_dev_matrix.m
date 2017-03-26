function [dev,slope_data] = get_dev_matrix(train_matrix)
%µÃµ½dev¾ØÕóºÍslope_data¾ØÕó
[row,col] = size(train_matrix);
dev = zeros(col,col);
count = 1;
for i=1:col
    for j=i+1:col
        count_num = 1;
        for k = 1:row
            if ((train_matrix(k,i) ~= 0) && (train_matrix(k,j) ~= 0))
                slope_data(count,1) = i;
                slope_data(count,2) = j;
                slope_data(count,3) = k;
                dev(i,j) = dev(i,j) + (train_matrix(k,i) - train_matrix(k,j)) ;
                count = count + 1;
                count_num = count_num + 1;
            end
        end
        dev(i,j) = dev(i,j) / count_num;
    end
end