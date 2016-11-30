function [yTr] = kPCA(xTr, k)

% xx = w(:,1:10000);
m = mean(xTr);
x = xTr-repmat(m,size(xTr,1),1);
n = size(x,1);
%-----Kernal PCA-----

%computation of Gramm Matrix K
type = 'poly';
p = 3; gamma = -0.005; beta0 = 2; beta1 = 0;
KK = kernel(x, type, p, gamma, beta0, beta1);
temp = ones(n,1)*ones(n,1)';
K = (eye(n)-1/n.*temp) * KK * (eye(n)-1/n.*temp);

%computing eigvectors and eigvalues of K
[W D] = eig(K);
%k = 100;
E = diag(D);
[E_sort, I] = sort(-1*E);
P = -1*E_sort;
Q = P.^(1/2);
R = repmat(Q',n,1);
A = W(:,I(1:n));
B = R.*A;
V = B(:, 1:k);

%Final projecton
yy = V' * K';
yTr = yy';
end


