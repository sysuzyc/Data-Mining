data = load('Dataset.mat');
data = data.Dataset ;
label = load('labels.mat');
label = label.labels ;
n = size(data,1);

for i = 1:n
    for j = 1:n
        if data(i,j) ~= data(j,i)
            data(i,j) = 1 ;
            data(j,i) = 1 ;
        end
    end
end

netplot(data); %输出网络图，便于直观观察

[mod,s1] = fast_unfolding(data) ; %运行fast_unfolding算法，结果保存在s1中
[s2] = LPA(data) ; %运行LPA算法，结果保存在s2中
