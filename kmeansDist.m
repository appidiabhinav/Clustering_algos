function [ index ] = kmeansDist( x, mu )

% x is a single data point and 
%mu is the set of cluster medians(means)

k = size(mu,1);
dist = [];
for i = 1:k
    temp = x - mu(i,:);
    dist(i,1) = sqrt(temp*temp');
end

[Y I] = min(dist);
index = I;

end

