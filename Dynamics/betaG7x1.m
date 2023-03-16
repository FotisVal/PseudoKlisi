function Bg = betaG7x1(x,parameters)

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

Bg(1,1) = Bg1(M,alfaA,alfaP,g,m1F,m2F,m1T,m2T,mcw);
Bg(2,1) = Bg2(M,alfaA,alfaP,g,m1F,m2F,m1T,m2T,mcw);
Bg(3,1) = Bg3(alfaA,alfaP,g,ksiF,ksiT,l1,l2,l3,l4,l5,l1T,l1Tx,m1T,thetaF,thetaK);
Bg(4,1) = Bg4(alfaA,alfaP,g,ksiF,ksiT,l1,l2,l3,l4,l5,l2T,l2Tx,m2T,psiF,psiK);
Bg(5,1) = Bg5(L1F,alfaA,alfaP,g,ksiF,ksiT,l1,l2,l3,l4,l5,l6,l1F,l1T,l1Tx,m1F,m1T,thetaF,thetaK);
Bg(6,1) = Bg6(L2F,alfaA,alfaP,g,ksiF,ksiT,l1,l2,l3,l4,l5,l6,l2F,l2T,l2Tx,m2F,m2T,psiF,psiK);
Bg(7,1) = Bg7(alfaA,alfaP,g,mcw,rcw,thetaD);

end

