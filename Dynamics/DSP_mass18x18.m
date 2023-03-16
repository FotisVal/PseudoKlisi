function [Mass_18x18] = DSP_mass18x18(t,x,param,footshape)

Mass_16x16 = SSP1_mass16x16(t,x,param,footshape);

Lamda2_7x2=Lamda2_J(x,param,footshape);
Lamda2_2x7=Lamda2_7x2';

extra_16x2=[zeros(7,2);-Lamda2_7x2;zeros(2,2)];
Mass_16x18=[Mass_16x16,extra_16x2];

extra_2x18=[Lamda2_2x7,zeros(2,11)];
Mass_18x18=[Mass_16x18;extra_2x18];

end

