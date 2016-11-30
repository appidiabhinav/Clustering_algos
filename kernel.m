function [ K ] = kernel( x, type, p, gamma, beta0, beta1)

for l = 1:size(x,1)
    for j = 1:size(x,1)
        inPro = x(l,:)*x(j,:)';
        diff = x(l,:)-x(j,:);
        switch type
            case 'linear'
                temp = inPro;
            case 'poly'
                temp = (1+inPro)^p;
            case 'rbf'
                temp = exp(gamma*(diff)*(diff)');
            case 'sigmoid'
                temp = tanh((beta0*inPro) + beta1);
        end
        K(l,j) = temp;
    end
end
end
