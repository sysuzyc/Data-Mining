function [ res,rmse ] = RSVD( train_data,test_data )
%RSVD Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(train_data) ;

dim = 15 ;
ku = 0.01 ; km = 0.01 ; lambda = 0.001 ;
T = 500 ; %设置好参数

U = rand(m,dim) ;  V = rand(n,dim) ;
last_E = -1 ;
for t = 1:T
    if(t ~= 1)
        last_E = E ;
    end
    [E,grad_U,grad_V] = CostFunction(train_data,U,V,ku,km) ; % 计算代价函数值以及梯度
    if(t ~= 1 && E-last_E > 0)
        break ;
    end
    fprintf('Iter #%d: %f ',t,E) ;
    fprintf('grad_U:%f grad_V:%f\n',norm(grad_U),norm(grad_V)) ;
    U = U + lambda*grad_U ;
    V = V + lambda*grad_V ; % 根据梯度更新U和V的值
end

pred = U*V' ;
pred(pred < 1) = 1 ; pred(pred > 5) = 5 ;
res = pred((m+1-size(test_data,1)):m , (n+1-size(test_data,2)):n) ;
res(test_data == 0) = 0 ;
[ii,~] = find(test_data) ;

rmse = sqrt(sum(sum((res-test_data).^2))/size(ii,1)) ; % 计算rmse

end

