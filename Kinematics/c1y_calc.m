function c1y = c1y_calc(L1F,L1T,ksiF,ksiT,l1,l2,l3,l4,l5,l6,thetaF,thetaK,yH)
%C1Y_CALC
%    C1Y = C1Y_CALC(L1F,L1T,KSIF,KSIT,L1,L2,L3,L4,L5,L6,THETAF,THETAK,YH)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:43:42

t2 = cos(thetaK);
t3 = sin(thetaK);
t4 = l1.^2;
t5 = l2.^2;
t6 = l3.^2;
t7 = l4.^2;
t9 = 1.0./l1;
t11 = pi./2.0;
t8 = l4.*t2;
t14 = -t11;
t17 = t4./2.0;
t18 = t5./2.0;
t19 = t6./2.0;
t20 = t7./2.0;
t21 = l4.*t3.*1i;
t10 = l3.*t8;
t13 = -t8;
t22 = -t18;
t12 = t10.*2.0;
t15 = -t10;
t24 = l3+t13+t21;
t16 = -t12;
t25 = angle(t24);
t27 = t15+t17+t19+t20+t22;
t23 = t6+t7+t16;
t26 = 1.0./sqrt(t23);
t28 = t9.*t26.*t27;
t29 = acos(t28);
c1y = yH+sin(ksiF+t14+t25+t29+thetaF).*(l1-l5)+sin(ksiF+t14+thetaF).*(l3-l6)-L1F.*cos(thetaF)-L1T.*cos(ksiF+ksiT+t25+t29+thetaF)+sin(ksiF+t11+t25+thetaF)./t26;
