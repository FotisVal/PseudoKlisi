function [matrix_B] = SSP2_beta16x1(t,x,parameters,footshape)

matrix_B(1,1) = x(8);
matrix_B(2,1) = x(9);
matrix_B(3,1) = x(10);
matrix_B(4,1) = x(11);
matrix_B(5,1) = x(12);
matrix_B(6,1) = x(13);
matrix_B(7,1) = x(14);

matrix_B(8:14,1)=SSP2_betaCon7x1(x,parameters,footshape);

matrix_B(15,1) = 0;
matrix_B(16,1) = 0;

end

