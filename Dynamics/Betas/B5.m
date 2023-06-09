function Bi = B5(I1T,L1F,alfaA,g,ksiF,ksiT,l1,l2,l3,l4,l5,l6,l1F,l1T,l1Tx,m1F,m1T,thetaF,thetaK,thetaF_d,thetaK_d,xH_d,yH_d)
%B5
%    BI = B5(I1T,L1F,ALFAA,G,KSIF,KSIT,L1,L2,L3,L4,L5,L6,L1F,L1T,L1TX,M1F,M1T,THETAF,THETAK,THETAF_D,THETAK_D,XH_D,YH_D)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:44:27

t2 = cos(alfaA);
t3 = sin(alfaA);
t4 = cos(thetaF);
t5 = cos(thetaK);
t6 = sin(thetaF);
t7 = sin(thetaK);
t8 = l1.^2;
t9 = l2.^2;
t10 = l3.^2;
t11 = l4.^2;
t12 = l4.^3;
t18 = -l5;
t19 = -l6;
t20 = 1.0./l1;
t25 = pi./2.0;
t13 = t7.^2;
t14 = t7.^3;
t15 = L1F.*t4;
t16 = L1F.*t6;
t17 = l4.*t5;
t21 = 1.0./t8;
t23 = l1F.*t4.*thetaF_d;
t24 = l1F.*t6.*thetaF_d;
t27 = -t8;
t28 = -t9;
t30 = l1+t18;
t31 = l3+t19;
t33 = -t25;
t37 = t8./2.0;
t38 = t9./2.0;
t39 = t10./2.0;
t40 = t11./2.0;
t41 = l4.*t7.*1i;
t46 = t5.*t7.*t11.*2.0;
t22 = l3.*t17;
t29 = -t15;
t32 = -t17;
t34 = t24+yH_d;
t42 = t23+xH_d;
t43 = -t38;
t45 = t11.*t13;
t47 = ksiF+t33+thetaF;
t26 = t22.*2.0;
t35 = -t22;
t44 = l3+t32;
t48 = cos(t47);
t49 = sin(t47);
t36 = -t26;
t50 = t44.^2;
t52 = 1.0./t44;
t55 = l4.*t7.*t44.*2.0;
t57 = t41+t44;
t61 = t31.*t48;
t62 = t31.*t49;
t89 = t35+t37+t39+t40+t43;
t51 = t50.^2;
t53 = 1.0./t50;
t54 = t52.^3;
t56 = t10+t11+t36;
t58 = t17.*t52;
t59 = l4.*t7.*t52;
t60 = angle(t57);
t65 = t32.*t52;
t71 = t45+t50;
t77 = t46+t55;
t91 = t89.^2;
t63 = 1.0./t56;
t66 = sqrt(t56);
t67 = t45.*t53;
t72 = t12.*t14.*t54.*2.0;
t73 = t5.*t7.*t11.*t53.*3.0;
t75 = 1.0./t71;
t78 = t9+t27+t56;
t79 = t8+t28+t56;
t80 = ksiF+t25+t60+thetaF;
t64 = t63.^2;
t68 = 1.0./t66;
t74 = -t72;
t76 = t75.^2;
t81 = t79.^2;
t82 = cos(t80);
t83 = sin(t80);
t88 = t65+t67;
t90 = (t58-t67).^2;
t102 = t21.*t63.*t91;
t106 = l3.*l4.*t7.*t21.*t63.*t89.*2.0;
t114 = -t50.*t75.*(t58-t67);
t117 = l4.*t7.*t44.*t75.*(t58-t67).*-2.0;
t69 = t68.^3;
t70 = t68.^5;
t84 = t20.*t22.*t68;
t85 = l3.*l4.*t7.*t20.*t68;
t92 = t66.*t82;
t93 = t66.*t83;
t94 = l3.*l4.*t7.*t68.*t82;
t95 = l3.*l4.*t7.*t68.*t83;
t96 = (t21.*t63.*t81)./4.0;
t100 = t59+t73+t74;
t103 = t20.*t68.*t89;
t105 = -t102;
t110 = l3.*l4.*t7.*t21.*t64.*t91.*2.0;
t131 = -t50.*t76.*t77.*(t58-t67);
t132 = t50.*t76.*t77.*(t58-t67);
t86 = t10.*t20.*t45.*t69.*2.0;
t97 = -t95;
t98 = -t96;
t104 = acos(t103);
t107 = t20.*t22.*t69.*t89;
t108 = t105+1.0;
t109 = l3.*l4.*t7.*t20.*t69.*t89;
t111 = t20.*t35.*t69.*t89;
t113 = -t110;
t118 = t10.*t20.*t45.*t70.*t89.*3.0;
t130 = t50.*t75.*t100;
t136 = t92.*t114;
t137 = t93.*t114;
t87 = -t86;
t99 = t98+1.0;
t112 = -t109;
t115 = 1.0./sqrt(t108);
t119 = ksiF+ksiT+t60+t104+thetaF;
t127 = t47+t60+t104;
t138 = t106+t113;
t101 = 1.0./sqrt(t99);
t116 = t115.^3;
t120 = cos(t119);
t121 = sin(t119);
t128 = cos(t127);
t129 = sin(t127);
t135 = t85+t112;
t140 = t84+t87+t111+t118;
t122 = l1T.*t120;
t123 = l1Tx.*t120;
t124 = l1T.*t121;
t125 = l1Tx.*t121;
t133 = t30.*t128;
t134 = t30.*t129;
t139 = t115.*t135;
t143 = t115.*t140;
t144 = (t116.*t135.*t138)./2.0;
t126 = -t122;
t141 = t114+t139;
t150 = t16+t61+t92+t123+t124+t133;
t157 = t117+t130+t132+t143+t144;
t142 = t141.^2;
t145 = t122.*t141;
t146 = t123.*t141;
t147 = t124.*t141;
t148 = t125.*t141;
t149 = t126.*t141;
t151 = t150.*thetaF_d;
t152 = t133.*t141;
t153 = t134.*t141;
t154 = t29+t62+t93+t125+t126+t134;
t155 = t154.*thetaF_d;
t158 = t97+t136+t146+t147+t152;
t159 = t94+t137+t148+t149+t153;
t156 = -t155;
t160 = t158.*thetaK_d;
t161 = t159.*thetaK_d;
t162 = -t160;
t165 = t156+t161;
t163 = t151+t162;
t166 = t165+xH_d;
t164 = t163+yH_d;
et1 = (m1T.*(t159.*t164.*2.0+t158.*t166.*2.0-t150.*(thetaK_d.*(t92.*t117+t92.*t130+t92.*t132+t125.*t142+t126.*t142+t134.*t142+t123.*t157+t124.*t157+t133.*t157+t35.*t68.*t83+t10.*t45.*t69.*t83+t51.*t76.*t90.*t93-t50.*t75.*t94.*(t58-t67).*2.0)-t159.*thetaF_d).*2.0-t154.*(t158.*thetaF_d-thetaK_d.*(-t93.*t130+t93.*t131+t123.*t142+t124.*t142+t133.*t142+t122.*t157-t125.*t157-t134.*t157+t35.*t68.*t82+t10.*t45.*t69.*t82+t51.*t76.*t90.*t92+t50.*t75.*t95.*(t58-t67).*2.0+t55.*t75.*t93.*(t58-t67))).*2.0))./2.0;
et2 = -I1T.*thetaK_d.*(l3.*l4.*t7.*t63-l3.*t7.*t11.*t64.*(l4-l3.*t5).*2.0+t10.*t20.*t45.*t69.*t101+(t20.*t22.*t69.*t78.*t101)./2.0-t10.*t20.*t45.*t70.*t78.*t101.*(3.0./2.0)+(l3.*l4.*t7.*t20.*t69.*t78.*t101.^3.*(l3.*l4.*t7.*t21.*t63.*t79-(l3.*l4.*t7.*t21.*t64.*t81)./2.0))./4.0);
Bi = thetaF_d.*((m1T.*(t150.*t166.*2.0-t154.*t163.*2.0+t154.*t164.*2.0+t150.*(t155-t161).*2.0))./2.0-(m1F.*(l1F.*t4.*t34.*2.0-l1F.*t6.*t42.*2.0))./2.0)+(m1F.*(t23.*t34.*2.0-t24.*t42.*2.0))./2.0-(m1T.*(t163.*t166.*2.0+t164.*(t155-t161).*2.0))./2.0-thetaK_d.*(et1+et2)-g.*m1T.*(t2.*t150-t3.*t154)-g.*m1F.*(l1F.*t3.*t4+l1F.*t2.*t6);
