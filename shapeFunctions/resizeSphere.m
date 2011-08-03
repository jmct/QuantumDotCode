function sphere1 = resizeSphere(oldSphere, scaleFactor)
    
    
    sphere1 = [oldSphere(1), oldSphere(2:4)*scaleFactor + 1, ...
        oldSphere(5)*scaleFactor];


end