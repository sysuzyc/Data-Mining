function  [cluster_distance,cent_of_clustering] = my_kmeans(Dataset,K)
[row,col] = size(Dataset);
% 存储质心
cent_of_clustering = zeros(K,col);%censet作为储存中心点的矩阵

% 随机初始化质心
for i= 1:col
    minV = min(Dataset(:,i));
    rangV = max(Dataset(:,i)) - minV;
    cent_of_clustering(:,i) = repmat(minV,[K,1]) + rangV*rand(K,1);
end

% 用于存储每个点被分配的cluster以及到质心的距离
cluster_distance = zeros(row,2);%用来储存每个点到中心点的距离，并标记其所处于的类。
cluster_Change = true;%用来储存中心点是否改变
%标记每个点距离质心的距离，然后归类，不断进行循环，直到稳定。
while cluster_Change
    cluster_Change = false;
    % 计算每个点应该被分配的cluster
    for i = 1:row
        minDist = 10000;
        minIndex = 0;
        for j = 1:K
            distCal = sqrt(sum(power((Dataset(i,:) - cent_of_clustering(j,:)),2)));%计算点和质心之间的欧式距离。
            %找到最小的距离，并标记下标
            if (distCal < minDist)
                minDist = distCal;
                minIndex = j;
            end
        end
        %对每一个点进行判断，看和上一次是否处于同一个簇中，如果全部一致，则聚类稳定。
        if minIndex ~= cluster_distance(i,1)            
            cluster_Change = true;
        end
        %将数据进行类的划分，并记住距离。
        cluster_distance(i,1) = minIndex;
        cluster_distance(i,2) = minDist;
    end

    % 更新每个cluster 的质心
    for j = 1:K
        %找到cluster_distance中是j这一类的点。
        simpleCluster = find(cluster_distance(:,1) == j);
        %求出这些点的均值，即为我们的类的质心。
        cent_of_clustering(j,:) = mean(Dataset(simpleCluster',:));
    end

end