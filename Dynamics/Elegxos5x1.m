function vectorEl = Elegxos5x1(x,k,parameters,footshape)
    
    if k==1
        gravtor = SSP1_GravComp(x,parameters,footshape);
    elseif k==2
        gravtor = SSP2_GravComp(x,parameters,footshape);
    else
        gravtor = DSP_GravComp(x,parameters,footshape);
    end
    
    vectorEl(1)=gravtor(1);
    vectorEl(2)=gravtor(2);
    vectorEl(3)=gravtor(3);
    vectorEl(4)=gravtor(4);
    vectorEl(5)=gravtor(5);

end