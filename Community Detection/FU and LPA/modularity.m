function [ Q ] = modularity( g , s )
%模块度计算公式

n = size(g,1);
m = sum(sum(g))/2 ;
Q = 0;
for i = 1:n
    for j = 1:n
        ki = sum(g(i,:)) ;
        kj = sum(g(j,:)) ;
        if (s(i)==s(j))
            Q = Q + (g(i,j)-(ki*kj)/(2*m)) ;
        end
    end
end
Q = Q/(2*m) ;
if(m == 0)
    Q = -1 ;
end

end

