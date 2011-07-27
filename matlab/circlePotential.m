function V = circlePotential(n, radius)
    center = (n+1)/2;
    
    V = zeros(n^2);
    dst = realmax;
    index = 1;
    
    for y = 1:n
        for x = 1:n
            dst = sqrt((abs(y-center)^2)+(abs(x-center))^2);
            index = coordToIndex(y,x, n);
            if (dst <= radius)
                V(index,index) = 0; 

            else
                V(index,index) = realmax;
            end
        end
    end
end