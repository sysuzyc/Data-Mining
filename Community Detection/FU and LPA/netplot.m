function netplot(G)
    n = size(G, 1);
    [x y] = pol2cart((0:n-1)*2*pi/n, 1);
    gplot(G, [x' y'], '-o');
end


