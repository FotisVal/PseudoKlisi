function [L] = Lamda_J(x,parameters,footshape)

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
m1F=parameters.m1F;     m1T=parameters.m1T;     m2F=parameters.m2F;     m2T=parameters.m2T;

I=parameters.I;
I1F=parameters.I1F;     I1T=parameters.I1T;     I2F=parameters.I2F;     I2T=parameters.I2T;

L1F=parameters.L1F;     L1T=parameters.L1T;     L2F=parameters.L2F;     L2T=parameters.L2T;
l1F=parameters.l1F;     l1T=parameters.l1T;     l2F=parameters.l2F;     l2T=parameters.l2T;
l1Tx=parameters.l1Tx;   l2Tx=parameters.l2Tx;
l1=parameters.l1;       l2=parameters.l2;       l3=parameters.l3;   l4=parameters.l4;   l5=parameters.l5;   l6=parameters.l6;
ksiF=parameters.ksiF;   ksiT=parameters.ksiT;
alfaA=parameters.alfaA;   g=parameters.g;

thetaT=thetaT_calc(ksiF,ksiT,l1,l2,l3,l4,thetaF,thetaK);
psiT=psiT_calc(ksiF,ksiT,l1,l2,l3,l4,psiF,psiK);


if and( wrapToPi(thetaT)>=min(footshape.psi) ,wrapToPi(thetaT) <= max(footshape.psi) )
    dxc1_dth=interp1(footshape.psi,footshape.dc2x_dps,thetaT,'pchip');
    dyc1_dth=interp1(footshape.psi,footshape.dc2y_dps,thetaT,'pchip');
elseif wrapToPi(thetaT)<min(footshape.psi)
    dxc1_dth=footshape.dc2x_dps(1);
    dyc1_dth=footshape.dc2y_dps(1);
else
    dxc1_dth=footshape.dc2x_dps(end);
    dyc1_dth=footshape.dc2y_dps(end);
end

if and( wrapToPi(psiT)>=min(footshape.psi) ,wrapToPi(psiT) <= max(footshape.psi) )
    dxc2_dps=interp1(footshape.psi,footshape.dc2x_dps,psiT,'pchip');
    dyc2_dps=interp1(footshape.psi,footshape.dc2y_dps,psiT,'pchip');
elseif wrapToPi(psiT)<min(footshape.psi)
    dxc2_dps=footshape.dc2x_dps(1);
    dyc2_dps=footshape.dc2y_dps(1);
else
    dxc2_dps=footshape.dc2x_dps(end);
    dyc2_dps=footshape.dc2y_dps(end);
end


dthT_dthK=DthT_DthK(l1,l2,l3,l4,thetaK);
dpsT_dpsK=DpsT_DpsK(l1,l2,l3,l4,psiK);

dpsT_dpsF = DpsT_DpsF();
dthT_dthF = DthT_DthF();

L(1,1)=L11;
L(1,2)=L12;
L(1,3)=L13;
L(1,4)=L14;

L(2,1)=L21;
L(2,2)=L22;
L(2,3)=L23;
L(2,4)=L24;

L(3,1)=L31(L1T,ksiF,ksiT,l1,l2,l3,l4,l5,thetaF,thetaK)-dxc1_dth*dthT_dthK;
L(3,2)=L32(L1T,ksiF,ksiT,l1,l2,l3,l4,l5,thetaF,thetaK)-dyc1_dth*dthT_dthK;
L(3,3)=L33;
L(3,4)=L34;

L(4,1)=L41;
L(4,2)=L42;
L(4,3)=L43(L2T,ksiF,ksiT,l1,l2,l3,l4,l5,psiF,psiK)-dxc2_dps*dpsT_dpsK;
L(4,4)=L44(L2T,ksiF,ksiT,l1,l2,l3,l4,l5,psiF,psiK)-dyc2_dps*dpsT_dpsK;

L(5,1)=L51(L1F,L1T,ksiF,ksiT,l1,l2,l3,l4,l5,l6,thetaF,thetaK)-dxc1_dth*dthT_dthF;
L(5,2)=L52(L1F,L1T,ksiF,ksiT,l1,l2,l3,l4,l5,l6,thetaF,thetaK)-dyc1_dth*dthT_dthF;
L(5,3)=L53;
L(5,4)=L54;

L(6,1)=L61;
L(6,2)=L62;
L(6,3)=L63(L2F,L2T,ksiF,ksiT,l1,l2,l3,l4,l5,l6,psiF,psiK)-dxc2_dps*dpsT_dpsF;
L(6,4)=L64(L2F,L2T,ksiF,ksiT,l1,l2,l3,l4,l5,l6,psiF,psiK)-dyc2_dps*dpsT_dpsF;

L(7,1)=L71;
L(7,2)=L72;
L(7,3)=L73;
L(7,4)=L74;

end