function Ldij = Ld32(L1T,ksiF,ksiT,l1,l2,l3,l4,l5,thetaF,thetaK,thetaF_d,thetaK_d)
%LD32
%    LDIJ = LD32(L1T,KSIF,KSIT,L1,L2,L3,L4,L5,THETAF,THETAK,THETAF_D,THETAK_D)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:44:41

t2 = cos(thetaK);
t3 = sin(thetaK);
t4 = l1.^2;
t5 = l2.^2;
t6 = l3.^2;
t7 = l4.^2;
t8 = l4.^3;
t12 = -l5;
t13 = 1.0./l1;
t16 = pi./2.0;
t9 = t3.^2;
t10 = t3.^3;
t11 = l4.*t2;
t14 = 1.0./t4;
t18 = l1+t12;
t20 = -t16;
t23 = t4./2.0;
t24 = t5./2.0;
t25 = t6./2.0;
t26 = t7./2.0;
t27 = l4.*t3.*1i;
t31 = t2.*t3.*t7.*2.0;
t15 = l3.*t11;
t19 = -t11;
t28 = -t24;
t30 = t7.*t9;
t17 = t15.*2.0;
t21 = -t15;
t29 = l3+t19;
t22 = -t17;
t32 = t29.^2;
t33 = 1.0./t29;
t36 = l4.*t3.*t29.*2.0;
t38 = t27+t29;
t65 = t21+t23+t25+t26+t28;
t34 = 1.0./t32;
t35 = t33.^3;
t37 = t6+t7+t22;
t39 = t11.*t33;
t40 = l4.*t3.*t33;
t41 = angle(t38);
t44 = t19.*t33;
t50 = t30+t32;
t56 = t31+t36;
t66 = t65.^2;
t42 = 1.0./t37;
t45 = sqrt(t37);
t46 = t30.*t34;
t51 = t8.*t10.*t35.*2.0;
t52 = t2.*t3.*t7.*t34.*3.0;
t54 = 1.0./t50;
t57 = ksiF+t16+t41+thetaF;
t43 = t42.^2;
t47 = 1.0./t45;
t53 = -t51;
t55 = t54.^2;
t58 = cos(t57);
t59 = sin(t57);
t64 = t44+t46;
t68 = t14.*t42.*t66;
t72 = l3.*l4.*t3.*t14.*t42.*t65.*2.0;
t80 = -t32.*t54.*(t39-t46);
t83 = l4.*t3.*t29.*t54.*(t39-t46).*-2.0;
t48 = t47.^3;
t49 = t47.^5;
t60 = t13.*t15.*t47;
t61 = l3.*l4.*t3.*t13.*t47;
t67 = t40+t52+t53;
t69 = t13.*t47.*t65;
t71 = -t68;
t76 = l3.*l4.*t3.*t14.*t43.*t66.*2.0;
t90 = -t32.*t55.*t56.*(t39-t46);
t91 = t32.*t55.*t56.*(t39-t46);
t62 = t6.*t13.*t30.*t48.*2.0;
t70 = acos(t69);
t73 = t13.*t15.*t48.*t65;
t74 = t71+1.0;
t75 = l3.*l4.*t3.*t13.*t48.*t65;
t77 = t13.*t21.*t48.*t65;
t79 = -t76;
t84 = t6.*t13.*t30.*t49.*t65.*3.0;
t89 = t32.*t54.*t67;
t63 = -t62;
t78 = -t75;
t81 = 1.0./sqrt(t74);
t85 = ksiF+ksiT+t41+t70+thetaF;
t87 = ksiF+t20+t41+t70+thetaF;
t93 = t72+t79;
t82 = t81.^3;
t86 = cos(t85);
t88 = sin(t87);
t92 = t61+t78;
t95 = t60+t63+t77+t84;
t94 = t81.*t92;
t98 = t81.*t95;
t99 = (t82.*t92.*t93)./2.0;
t96 = t80+t94;
t100 = t83+t89+t91+t98+t99;
t97 = t96.^2;
Ldij = -thetaK_d.*(L1T.*t100.*sin(t85)+t18.*t100.*cos(t87)-L1T.*t86.*t97+t21.*t47.*t59+t45.*t58.*t83+t45.*t58.*t89+t45.*t58.*t91+t18.*t88.*t97+t6.*t30.*t48.*t59+1.0./t34.^2.*t45.*t55.*t59.*(t39-t46).^2-l3.*l4.*t3.*t32.*t47.*t54.*t58.*(t39-t46).*2.0)-thetaF_d.*(L1T.*t86.*t96-t18.*t88.*t96-l3.*l4.*t3.*t47.*t58+t32.*t45.*t54.*t59.*(t39-t46));
