function [ E,grad_U,grad_V ] = CostFunction( train_data,U,V,ku,km )
%COSTFUNCTION Summary of this function goes here
%   Detailed explanation goes here

ind = train_data~=0 ;
prod = U*V' ;
prod(prod < 1) = 1 ;
prod(prod > 5) = 5 ;
sub = train_data - prod ;
E = sum(sub(ind).^2)/2 + ku*sum(sum(U.^2))/2 + km*sum(sum(V.^2))/2 ;

grad_U = zeros(size(U)) ;
grad_V = zeros(size(V)) ;

for i = 1:size(U,1)
    sum_ = zeros(1,size(U,2)) ;
    for j = 1:size(U,2)
        if(ind(i,j))
            sum_ = sum_ + (train_data(i,j)-prod(i,j))*V(j,:) ; 
        end
    end
    grad_U(i,:) = sum_ - ku*U(i,:) ;
end

for j = 1:size(V,1)
    sum_ = zeros(1,size(V,2)) ;
    for i = 1:size(V,2)
        if(ind(i,j))
            sum_ = sum_ + (train_data(i,j)-prod(i,j))*U(i,:) ; 
        end
    end
    grad_V(j,:) = sum_ - km*V(j,:) ;
end

end

