%close all;clc;clear;
K = 2;%聚类的个数
load('ringData.mat');%载入数据ringData
%load('GaussianData.mat');%载入数据GuassianData
%找到数据集中的分好的类的质心的矩阵，以及每个点的所处的类。
[cluster_distance,cent_of_clustering] = my_kmeans(Dataset,K);
%通过得到的数据，进行划分，得到最终的图形
draw_picture(cluster_distance,cent_of_clustering,Dataset,K);