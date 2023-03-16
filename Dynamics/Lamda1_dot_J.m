function [Ld1] = Lamda1_dot_J(x,param,footshape)

Ld=Lamda_dot_J(x,param,footshape);
Ld1=Ld(1:7,1:2);

end