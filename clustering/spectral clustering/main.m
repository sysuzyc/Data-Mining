%clc;close all;clear
load('ringData.mat');
%load('GaussianData.mat');
Dataset=Dataset/max(max(abs(Dataset)));
num_clusters=2;
num_of_gauss=0.1;

Z=pdist(Dataset);
W=squareform(Z);
[D,L,V] = spectral(W,num_of_gauss, num_clusters);
[cluster_distance,cent_of_clustering] = my_kmeans(V,num_clusters);
draw_picture(cluster_distance,cent_of_clustering,Dataset,num_clusters);