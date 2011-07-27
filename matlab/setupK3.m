function H = setupH3(n)

    H1 = setCoefficient(n, 2);
    I1 = eye(n);

    H = zeros(n^3);
    
    temp1 = tensorProd(H1,I1);
    temp1 = tensorProd(temp1, I1);
    
    temp2 = tensorProd(I1,H1);
    temp2 = tensorProd(temp2,I1);
    
    temp3 = tensorProd(I1,I1);
    temp3 = tensorProd(temp3, H1);
    
    
    H = temp1 + temp2 + temp3;

end