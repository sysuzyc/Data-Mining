function [ best_mod,new_data,s ] = optimazation( data )
%单步模块度优化的函数

n = size(data,1);
init_s = [1:n] ;
init_mod = modularity(data,init_s) ;
best_mod = init_mod ;
s = init_s ;
while(1)
    [mod,s] = modify(data,s) ; %进行一次更改
    if(mod == best_mod) %当模块度无法再提升时
        a = unique(s);
        b = numel(a) ;
        for i = 1:n
            pos = find(a==s(i)) ;
            s(i) = pos ;
        end
        break ;
    else
        best_mod = mod ; %更新最优的模块度
    end
end
new_data = zeros(b) ;
for i = 1:b %对于最优的社区划分进行合并
    for j = 1:b
        if(i~=j)
            tmp = data(s==i,s==j) ;
            new_data(i,j) = sum(sum(tmp))/2 ;    
        end
    end
end
end

