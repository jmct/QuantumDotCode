function shapeMatrix = drawShape(V)
	n = sqrt(size(V,2));
    V = diag(V);   
    
    shapeMatrix = zeros(n);
    
    for i = 1:n
        shapeMatrix(i,:) = V(((n*(i-1))+1):(n*i));
    end


end