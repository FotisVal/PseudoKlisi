function vectorSk = SSP1_betaCon7x1(x,parameters,footshape)

    gravtor = SSP1_GravComp(x,parameters,footshape);
    vectorB = beta7x1(x,parameters);
    vectorSk(1)=vectorB(1);
    vectorSk(2)=vectorB(2);
    vectorSk(3)=gravtor(1)+vectorB(3);
    vectorSk(4)=gravtor(2)+vectorB(4);
    vectorSk(5)=gravtor(3)+vectorB(5);
    vectorSk(6)=gravtor(4)+vectorB(6);
    vectorSk(7)=gravtor(5)+vectorB(7);
    
end
