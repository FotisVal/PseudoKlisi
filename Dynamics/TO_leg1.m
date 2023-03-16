function [value,isterminal,direction] = TO_leg1(t,x,parameters,footshape)

xH=x(1);
yH=x(2);
thetaK = x(3);
psiK = x(4);
thetaF = x(5);
psiF = x(6);
thetaD = x(7);

xH_d = x(8);
yH_d =x(9);
thetaK_d = x(10);
psiK_d = x(11);
thetaF_d = x(12);
psiF_d = x(13);
thetaD_d = x(14);

M=parameters.M;
mcw=parameters.mcw;     Icw=parameters.Icw;
m1F=parameters.m1F;     m1T=parameters.m1T;     m2F=parameters.m2F;     m2T=parameters.m2T;

I=parameters.I;
I1F=parameters.I1F;     I1T=parameters.I1T;     I2F=parameters.I2F;     I2T=parameters.I2T;

L1F=parameters.L1F;     L1T=parameters.L1T;     L2F=parameters.L2F;     L2T=parameters.L2T;
l1F=parameters.l1F;     l1T=parameters.l1T;     l2F=parameters.l2F;     l2T=parameters.l2T;
l1Tx=parameters.l1Tx;   l2Tx=parameters.l2Tx;
l1=parameters.l1;       l2=parameters.l2;       l3=parameters.l3;   l4=parameters.l4;   l5=parameters.l5;   l6=parameters.l6;
rcw=parameters.rcw;
ksiF=parameters.ksiF;   ksiT=parameters.ksiT;
alfaA=parameters.alfaA;   alfaP=parameters.alfaP;   g=parameters.g;

%
% qi=x(1:7);
qdoti=x(8:14);

L7x4=Lamda_J(x,parameters,footshape);
Ld7x4=Lamda_dot_J(x,parameters,footshape);
LT4x7=L7x4.';

Matrix_M7x7=mass7x7(x,parameters);
matrixB7x1=beta7x1(x,parameters);
invM7x7=(Matrix_M7x7)\eye(7);

lamdas4x1=-inv(LT4x7*invM7x7*L7x4)*((Ld7x4.')*qdoti+LT4x7*invM7x7*matrixB7x1);

value=lamdas4x1(2);
direction=0;
isterminal=1;
end
