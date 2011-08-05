function K = setupK3(n)

    K1 = setCoefficient(n, 1);
    I1 = sparse(1:n,1:n,1);

    
    temp1 = tensorProd(K1,I1);
    temp1 = tensorProd(temp1, I1);
    
    temp2 = tensorProd(I1,K1);
    temp2 = tensorProd(temp2,I1);
    
    temp3 = tensorProd(I1,I1);
    temp3 = tensorProd(temp3, K1);
    
    
    K = temp1 + temp2 + temp3;

end
