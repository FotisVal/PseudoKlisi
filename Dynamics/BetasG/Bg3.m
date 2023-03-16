function Bgi = Bg3(alfaA,alfaP,g,ksiF,ksiT,l1,l2,l3,l4,l5,l1T,l1Tx,m1T,thetaF,thetaK)
%BG3
%    BGI = BG3(ALFAA,ALFAP,G,KSIF,KSIT,L1,L2,L3,L4,L5,L1T,L1TX,M1T,THETAF,THETAK)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:44:32

t2 = cos(thetaK);
t3 = sin(thetaK);
t4 = l1.^2;
t5 = l2.^2;
t6 = l3.^2;
t7 = l4.^2;
t10 = -l5;
t11 = 1.0./l1;
t14 = pi./2.0;
t8 = t3.^2;
t9 = l4.*t2;
t12 = 1.0./t4;
t16 = l1+t10;
t18 = -t14;
t21 = t4./2.0;
t22 = t5./2.0;
t23 = t6./2.0;
t24 = t7./2.0;
t25 = l4.*t3.*1i;
t13 = l3.*t9;
t17 = -t9;
t26 = -t22;
t28 = t7.*t8;
t15 = t13.*2.0;
t19 = -t13;
t27 = l3+t17;
t20 = -t15;
t29 = t27.^2;
t30 = 1.0./t27;
t33 = t25+t27;
t49 = t19+t21+t23+t24+t26;
t31 = 1.0./t29;
t32 = t6+t7+t20;
t34 = t9.*t30;
t35 = angle(t33);
t37 = t17.*t30;
t42 = t28+t29;
t50 = t49.^2;
t36 = 1.0./t32;
t38 = sqrt(t32);
t39 = t28.*t31;
t43 = 1.0./t42;
t44 = ksiF+t14+t35+thetaF;
t40 = 1.0./t38;
t45 = cos(t44);
t46 = sin(t44);
t48 = t37+t39;
t54 = t12.*t36.*t50;
t61 = -t29.*t43.*(t34-t39);
t41 = t40.^3;
t47 = l3.*l4.*t3.*t11.*t40;
t51 = l3.*l4.*t3.*t40.*t45;
t52 = l3.*l4.*t3.*t40.*t46;
t55 = t11.*t40.*t49;
t57 = -t54;
t70 = t38.*t45.*t61;
t71 = t38.*t46.*t61;
t53 = -t52;
t56 = acos(t55);
t58 = t57+1.0;
t59 = l3.*l4.*t3.*t11.*t41.*t49;
t60 = -t59;
t62 = 1.0./sqrt(t58);
t63 = ksiF+ksiT+t35+t56+thetaF;
t66 = ksiF+t18+t35+t56+thetaF;
t64 = cos(t63);
t65 = sin(t63);
t67 = cos(t66);
t68 = sin(t66);
t69 = t47+t60;
t72 = t62.*t69;
t73 = t61+t72;
t74 = l1T.*t64.*t73;
t75 = l1Tx.*t64.*t73;
t76 = l1T.*t65.*t73;
t77 = l1Tx.*t65.*t73;
t79 = t16.*t67.*t73;
t80 = t16.*t68.*t73;
t78 = -t74;
t81 = t53+t70+t75+t76+t79;
t82 = t51+t71+t77+t78+t80;
Bgi = g.*m1T.*(t81.*cos(alfaA)-t82.*sin(alfaA))-g.*m1T.*(t81.*cos(alfaP)-t82.*sin(alfaP));
