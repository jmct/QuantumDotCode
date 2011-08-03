function cylinder1 = resizeCyl(oldCyl, scaleFactor)
    
    
    cylinder1 = [oldCyl(1), oldCyl(2:7)*scaleFactor + 1, ...
        oldCyl(8)*scaleFactor];


end