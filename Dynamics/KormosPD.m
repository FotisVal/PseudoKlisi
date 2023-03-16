function PDtor = KormosPD(x,parameters)

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
    mcw=parameters.mcw;     m1A=parameters.m1A;     m2A=parameters.m2A;
    m1F=parameters.m1F;     m1T=parameters.m1T;     m2F=parameters.m2F;     m2T=parameters.m2T;

    I=parameters.I;         Icw=parameters.Icw;     I1A=parameters.I1A;     I2A=parameters.I2A;
    I1F=parameters.I1F;     I1T=parameters.I1T;     I2F=parameters.I2F;     I2T=parameters.I2T;

    L1F=parameters.L1F;     L1T=parameters.L1T;     L2F=parameters.L2F;     L2T=parameters.L2T;
    L1A=parameters.L1A;     L2A=parameters.L2A;
    l1F=parameters.l1F;     l1T=parameters.l1T;     l2F=parameters.l2F;     l2T=parameters.l2T;
    l1Tx=parameters.l1Tx;   l2Tx=parameters.l2Tx;   l1A=parameters.l1A;     l2A=parameters.l2A;
    l1=parameters.l1;       l2=parameters.l2;       l3=parameters.l3;   l4=parameters.l4;   l5=parameters.l5;   l6=parameters.l6;
    rcw=parameters.rcw;     Rcw=parameters.Rcw;
    ksiF=parameters.ksiF;   ksiT=parameters.ksiT;
    alfaA=parameters.alfaA;   g=parameters.g;
    Kp=parameters.Kp;
    Kd=parameters.Kd;
    
    thetaDdes=90/180*pi;
    thetaD_ddes=0;
               
    PDtor=+mcw*g*(Rcw-rcw)*cos(thetaD);
    
end