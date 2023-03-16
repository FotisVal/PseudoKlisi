function DDpsT_DDpsK = DDpsT_DDpsK(l1,l2,l3,l4,psiK)
%DDPST_DDPSK
%    DDPST_DDPSK = DDPST_DDPSK(L1,L2,L3,L4,PSIK)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:44:49

t2 = cos(psiK);
t3 = sin(psiK);
t4 = l1.^2;
t5 = l2.^2;
t6 = l3.^2;
t7 = l4.^2;
t10 = 1.0./l1;
t8 = t3.^2;
t9 = l4.*t2;
t11 = 1.0./t4;
t17 = t4./2.0;
t18 = t5./2.0;
t19 = t6./2.0;
t20 = t7./2.0;
t12 = l3.*t9;
t14 = -t9;
t21 = -t18;
t23 = t7.*t8;
t13 = t12.*2.0;
t15 = -t12;
t22 = l3+t14;
t16 = -t13;
t24 = t22.^2;
t25 = 1.0./t22;
t37 = t15+t17+t19+t20+t21;
t26 = 1.0./t24;
t27 = t6+t7+t16;
t28 = t9.*t25;
t30 = t14.*t25;
t34 = t23+t24;
t38 = t37.^2;
t29 = 1.0./t27;
t31 = t23.*t26;
t32 = 1.0./sqrt(t27);
t35 = 1.0./t34;
t33 = t32.^3;
t36 = t30+t31;
t39 = t11.*t29.*t38;
t40 = -t39;
t41 = t40+1.0;
DDpsT_DDpsK = -1.0./sqrt(t41).*(t10.*t12.*t32-t6.*t10.*t23.*t33.*2.0+t10.*t15.*t33.*t37+t6.*t10.*t23.*t32.^5.*t37.*3.0)+(1.0./t41.^(3.0./2.0).*(l3.*l4.*t3.*t10.*t32-l3.*l4.*t3.*t10.*t33.*t37).*(l3.*l4.*t3.*t29.*t39.*2.0-l3.*l4.*t3.*t11.*t29.*t37.*2.0))./2.0-t24.*t35.*(l4.*t3.*t25-l4.^3.*t3.^3.*t25.^3.*2.0+t2.*t3.*t7.*t26.*3.0)-t24.*t35.^2.*(t28-t31).*(l4.*t3.*t22.*2.0+t2.*t3.*t7.*2.0)+l4.*t3.*t22.*t35.*(t28-t31).*2.0;