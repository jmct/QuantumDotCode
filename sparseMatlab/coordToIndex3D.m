function index = coordToIndex3D(i, j, k, n)
    index = ((k-1)*n^2) + ((j-1)*n) + i;
end