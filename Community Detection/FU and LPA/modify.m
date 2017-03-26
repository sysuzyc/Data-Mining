function [ best_mod,s ] = modify( data,s )
n = size(data,1);
init_mod = modularity(data,s) ;
for i = 1:n
    best_mod = init_mod ;
    for j = 1:n 
        if (data(i,j)==1)
            s_new = s ;
            for k = 1:i
                if(s(k)==i)
                    s_new(k) = j ;
                end
            end
            mod_new = modularity(data,s_new) ;
            if(mod_new>best_mod)
                best_mod = mod_new ;
                s = s_new ;
            end
        end
    end
end
end

