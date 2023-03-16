function [Mass_16x16] = SSP2_mass16x16(t,x,parameters,footshape)

M_7x7=mass7x7(x,parameters);

Lamda2_7x2=Lamda2_J(x,parameters,footshape);
Lamda2_2x7=Lamda2_7x2';

M_top=[eye(7),zeros(7,9)];
M_mid=[zeros(7),M_7x7,-Lamda2_7x2];
M_bot=[Lamda2_2x7,zeros(2,9)];

Mass_16x16=[M_top;M_mid;M_bot];

end

