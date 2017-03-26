function [D,L,V] = spectral(W,sigma, num_clusters)
    m = size(W, 1);
    %计算相似度矩阵  相似度矩阵由权值矩阵得到，实践中一般用高斯核函数
    W = W.*W;   %平方
    W = -W/(2*sigma*sigma);
    S = full(spfun(@exp, W)); % 在这里S即为相似度矩阵，也就是这不在以邻接矩阵计算，而是采用相似度矩阵

    %获得度矩阵D
    D = full(sparse(1:m, 1:m, sum(S))); %所以此处D为相似度矩阵S中一列元素加起来放到对角线上，得到度矩阵D

    % 获得拉普拉斯矩阵 Do laplacian, L = D^(-1/2) * S * D^(-1/2)
    L = eye(m)-(D^(-1/2) * S * D^(-1/2)); %拉普拉斯矩阵

    % 求特征向量 V
    %  eigs 'SM';绝对值最小特征值
    [V, ~] = eigs(L, num_clusters, 'SM');
end