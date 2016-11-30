clear all;
close all;
clc;

%-----Kernel Kmeans-----

xx = dlmread('seeds_dataset.txt', ' ');
x = xx(:, 1:7);
labels = xx(:, 8);
n = size(x,1);
c = 3;
k = 10;


y = kPCA(x,k);
l = kMeans(y, c);

%accuracy
m1 = mode(l(1:70));
n1 = sum(l(1:70)==m1);

m2 = mode(l(71:140));
n2 = sum(l(71:140)==m2);

m3 = mode(l(141:210));
n3 = sum(l(141:210)==m3);

accuracy = (n1+n2+n3)/n


  