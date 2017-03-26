function [ sim ] = similarity( x , y )
%相似度计算函数，使用的是余弦适应性公式

x = x - mean(x) ;
y = y - mean(y) ;

sim = (x*y')/(norm(x)*norm(y)) ;

end

