function [L1] = Lamda1_J(x,param,footshape)

L=Lamda_J(x,param,footshape);
L1=L(1:7,1:2);

end
