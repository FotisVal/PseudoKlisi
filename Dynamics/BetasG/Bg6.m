function Bgi = Bg6(L2F,alfaA,alfaP,g,ksiF,ksiT,l1,l2,l3,l4,l5,l6,l2F,l2T,l2Tx,m2F,m2T,psiF,psiK)
%BG6
%    BGI = BG6(L2F,ALFAA,ALFAP,G,KSIF,KSIT,L1,L2,L3,L4,L5,L6,L2F,L2T,L2TX,M2F,M2T,PSIF,PSIK)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:44:35

t2 = cos(alfaA);
t3 = cos(alfaP);
t4 = cos(psiF);
t5 = cos(psiK);
t6 = sin(alfaA);
t7 = sin(alfaP);
t8 = sin(psiF);
t9 = sin(psiK);
t10 = l1.^2;
t11 = l2.^2;
t12 = l3.^2;
t13 = l4.^2;
t17 = -l5;
t18 = -l6;
t19 = 1.0./l1;
t21 = pi./2.0;
t14 = L2F.*t4;
t15 = L2F.*t8;
t16 = l4.*t5;
t24 = l1+t17;
t25 = l3+t18;
t27 = -t21;
t30 = t10./2.0;
t31 = t11./2.0;
t32 = t12./2.0;
t33 = t13./2.0;
t34 = l4.*t9.*1i;
t20 = l3.*t16;
t23 = -t14;
t26 = -t16;
t35 = -t31;
t36 = ksiF+psiF+t27;
t22 = t20.*2.0;
t28 = -t20;
t37 = cos(t36);
t38 = sin(t36);
t40 = l3+t26+t34;
t29 = -t22;
t41 = angle(t40);
t42 = t25.*t37;
t43 = t25.*t38;
t49 = t28+t30+t32+t33+t35;
t39 = t12+t13+t29;
t46 = ksiF+psiF+t21+t41;
t44 = sqrt(t39);
t47 = cos(t46);
t48 = sin(t46);
t45 = 1.0./t44;
t50 = t44.*t47;
t51 = t44.*t48;
t52 = t19.*t45.*t49;
t53 = acos(t52);
t54 = ksiF+ksiT+psiF+t41+t53;
t62 = t36+t41+t53;
t55 = cos(t54);
t56 = sin(t54);
t63 = cos(t62);
t64 = sin(t62);
t57 = l2T.*t55;
t58 = l2Tx.*t55;
t59 = l2T.*t56;
t60 = l2Tx.*t56;
t65 = t24.*t63;
t66 = t24.*t64;
t61 = -t57;
t67 = t15+t42+t50+t58+t59+t65;
t68 = t23+t43+t51+t60+t61+t66;
Bgi = -g.*(m2F.*(l2F.*t2.*t8+l2F.*t4.*t6)+m2T.*(t2.*t67-t6.*t68))+g.*(m2F.*(l2F.*t3.*t8+l2F.*t4.*t7)+m2T.*(t3.*t67-t7.*t68));
