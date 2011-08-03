function index = coordToIndex3D(x, y, z, n)
    index = ((z-1)*n^2) + ((y-1)*n) + x;
end