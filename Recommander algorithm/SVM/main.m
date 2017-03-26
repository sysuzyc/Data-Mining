% a = load('train_small.txt');
% a = full(sparse(a(:,1),a(:,2),a(:,3)));
% [m,n] = size(a) ;
% test_data = a(90:m , 90:n) ;
% a(90:m , 90:n) = 0 ;
% train_data = a ;

a = load('train_small_2.txt');
a = full(sparse(a(:,1),a(:,2),a(:,3)));
[m,n] = size(a) ;
test_data = a(220:m , 240:n) ;
a(220:m , 240:n) = 0 ;
train_data = a ;

[res1,rmse1] = IBCF(train_data',test_data') ;
[res2,rmse2] = Slope(train_data,test_data) ;
[res3,rmse3] = RSVD(train_data,test_data) ;

