function cube1 = resizeCube(oldCube, scaleFactor)
    
    
    cube1 = [oldCube(1), oldCube(2:4)*scaleFactor + 1, ...
        oldCube(5:7)*scaleFactor];


end