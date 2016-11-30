function [in, mu] = kMeans( x, k )

%-----K-means-----
% xx = [2,8,7,6,7,5,4,4,-1,1,3,5,2,7; 7,1,5,3,8,9,5,2,-1,3,-2,3.25,4,1];
% x = xx';
%
% k = 2;
d = size(x,2);
n = size(x,1);


%Initialisation of parameter
mu = ones(k,d);
% a = 0;
% b = 10;
% for i = 1:k
%     mu(i,:) = a + (b-a).*rand(1,d);
%     a = a + 10;
%     b = b + 10;
% end
mu(1,:) = x(30,:);
mu(2,:) = x(100,:);
mu(3,:) = x(209,:);

in = zeros(n,1);
temp = zeros(n,1);

while 1
    %Expection(E) step
    for i = 1:n
        temp(i,1) = kmeansDist(x(i,:), mu);
    end
    
    if in==temp
        break;
    else
        in = temp;
    end
    %Maximisation(M) step
    for i = 1:k
        mu(i,:) = mean(x(find(in==i),:), 1);
    end
end
end
