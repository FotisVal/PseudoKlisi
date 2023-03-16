function [IC] = calculate_xinit(parameters,footshape,IC)

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
    alfaA=parameters.alfaA;   g=parameters.g;
    
    thetaK0=IC.q(1);
    psiK0=IC.q(2);
    thetaF0=IC.q(3);
    psiF0=IC.q(4);
    thetaD0=IC.q(5);
    

    thetaK_d0=IC.qd(1);
    psiK_d0=IC.qd(2);
    thetaF_d0=IC.qd(3);
    psiF_d0=IC.qd(4);
    thetaD_d0=IC.qd(5);
    
    thetaT0 = thetaT_calc(ksiF,ksiT,l1,l2,l3,l4,thetaF0,thetaK0);
    thetaT_d0 = thetaT_d_calc(l1,l2,l3,l4,thetaK0,thetaF_d0,thetaK_d0);
    psiT0 = psiT_calc(ksiF,ksiT,l1,l2,l3,l4,psiF0,psiK0);
    psiT_d0= psiT_d_calc(l1,l2,l3,l4,psiK0,psiF_d0,psiK_d0);
    
    cx0=0;
    cy0=sin(-thetaT0-interp1(footshape.psi,footshape.fi,thetaT0))*interp1(footshape.psi,footshape.r,thetaT0);
    cx_d0=interp1(footshape.psi,footshape.dc2x_dps,thetaT0)*thetaT_d0;
    cy_d0=interp1(footshape.psi,footshape.dc2y_dps,thetaT0)*thetaT_d0;
    
    c1xH0 = c1x_calc(L1F,L1T,ksiF,ksiT,l1,l2,l3,l4,l5,l6,thetaF0,thetaK0,0);
    c1yH0 = c1y_calc(L1F,L1T,ksiF,ksiT,l1,l2,l3,l4,l5,l6,thetaF0,thetaK0,0);
    c1x_dH0 = c1x_d_calc(L1F,L1T,ksiF,ksiT,l1,l2,l3,l4,l5,l6,thetaF0,thetaK0,thetaF_d0,thetaK_d0,0);
    c1y_dH0 = c1y_d_calc(L1F,L1T,ksiF,ksiT,l1,l2,l3,l4,l5,l6,thetaF0,thetaK0,thetaF_d0,thetaK_d0,0);
    xH0=cx0-c1xH0;      xH_d0=cx_d0-c1x_dH0;
    yH0=cy0-c1yH0;      yH_d0=cy_d0-c1y_dH0;
    
    xinit=[xH0,yH0,thetaK0,psiK0,thetaF0,psiF0,thetaD0,xH_d0,yH_d0,thetaK_d0,psiK_d0,thetaF_d0,psiF_d0,thetaD_d0,0,0]';
    IC.xinit=xinit;
    IC.below_knee=[thetaT0, psiT0, thetaT_d0, psiT_d0];

end