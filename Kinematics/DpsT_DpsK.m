function DpsT_DpsK = DpsT_DpsK(l1,l2,l3,l4,psiK)
%DPST_DPSK
%    DPST_DPSK = DPST_DPSK(L1,L2,L3,L4,PSIK)

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
t16 = t4./2.0;
t17 = t5./2.0;
t18 = t6./2.0;
t19 = t7./2.0;
t11 = l3.*t9;
t13 = -t9;
t20 = -t17;
t12 = t11.*2.0;
t14 = -t11;
t21 = l3+t13;
t15 = -t12;
t22 = t21.^2;
t24 = t14+t16+t18+t19+t20;
t23 = t6+t7+t15;
DpsT_DpsK = -1.0./sqrt(-t24.^2./(t4.*t23)+1.0).*(l3.*l4.*t3.*t10.*1.0./sqrt(t23)-l3.*l4.*t3.*t10.*1.0./t23.^(3.0./2.0).*t24)+(t22.*(t9./t21-(t7.*t8)./t22))./(t22+t7.*t8);