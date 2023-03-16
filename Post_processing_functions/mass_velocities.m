function [vx,vy] = mass_velocities(parameters,x)

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
    m1F=parameters.m1F;     m1T=parameters.m1T;     m2F=parameters.m2F;     m2T=parameters.m2T;
    
    I=parameters.I;
    I1F=parameters.I1F;     I1T=parameters.I1T;     I2F=parameters.I2F;     I2T=parameters.I2T;
    
    L1F=parameters.L1F;     L1T=parameters.L1T;     L2F=parameters.L2F;     L2T=parameters.L2T;
    l1F=parameters.l1F;     l1T=parameters.l1T;     l2F=parameters.l2F;     l2T=parameters.l2T;
    l1Tx=parameters.l1Tx;   l2Tx=parameters.l2Tx;
    l1=parameters.l1;       l2=parameters.l2;       l3=parameters.l3;   l4=parameters.l4;   l5=parameters.l5;   l6=parameters.l6;
    ksiF=parameters.ksiF;   ksiT=parameters.ksiT;
    alfaA=parameters.alfaA;   g=parameters.g;

vy=[yH_d, yH_d + l1F*thetaF_d*sin(thetaF), yH_d - thetaK_d*(cos(ksiF + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(((l3*l4*sin(thetaK))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(thetaK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(thetaK)^2 + 1) - (l3*cos(thetaK))/sin(thetaK)^2))/((l3/sin(thetaK) - l4*cot(thetaK))^2 + l4^2))*(l1 - l6) + l1Tx*cos(ksiF + ksiT + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(((l3*l4*sin(thetaK))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(thetaK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(thetaK)^2 + 1) - (l3*cos(thetaK))/sin(thetaK)^2))/((l3/sin(thetaK) - l4*cot(thetaK))^2 + l4^2)) + l1T*sin(ksiF + ksiT + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(((l3*l4*sin(thetaK))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(thetaK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(thetaK)^2 + 1) - (l3*cos(thetaK))/sin(thetaK)^2))/((l3/sin(thetaK) - l4*cot(thetaK))^2 + l4^2)) - (l3*l4*sin(ksiF + thetaF + pi/2 + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*sin(thetaK))/(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2) + (l4*cos(ksiF + thetaF + pi/2 + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(l4*(cot(thetaK)^2 + 1) - (l3*cos(thetaK))/sin(thetaK)^2)*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))/((l3/sin(thetaK) - l4*cot(thetaK))^2 + l4^2)) + thetaF_d*(cos(ksiF + thetaF - pi/2)*(l3 - l6) + cos(ksiF + thetaF + pi/2 + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2) + L1F*sin(thetaF) + cos(ksiF + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(l1 - l6) + l1Tx*cos(ksiF + ksiT + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK))) + l1T*sin(ksiF + ksiT + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))), yH_d + l2F*psiF_d*sin(psiF), yH_d - psiK_d*(cos(ksiF + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(l1 - l6)*(((l3*l4*sin(psiK))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(psiK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(psiK)^2 + 1) - (l3*cos(psiK))/sin(psiK)^2))/((l3/sin(psiK) - l4*cot(psiK))^2 + l4^2)) + l2Tx*cos(ksiF + ksiT + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(((l3*l4*sin(psiK))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(psiK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(psiK)^2 + 1) - (l3*cos(psiK))/sin(psiK)^2))/((l3/sin(psiK) - l4*cot(psiK))^2 + l4^2)) + l2T*sin(ksiF + ksiT + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(((l3*l4*sin(psiK))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(psiK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(psiK)^2 + 1) - (l3*cos(psiK))/sin(psiK)^2))/((l3/sin(psiK) - l4*cot(psiK))^2 + l4^2)) - (l3*l4*sin(ksiF + psiF + pi/2 + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*sin(psiK))/(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2) + (l4*cos(ksiF + psiF + pi/2 + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(l4*(cot(psiK)^2 + 1) - (l3*cos(psiK))/sin(psiK)^2)*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))/((l3/sin(psiK) - l4*cot(psiK))^2 + l4^2)) + psiF_d*(cos(ksiF + psiF - pi/2)*(l3 - l6) + cos(ksiF + psiF + pi/2 + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2) + cos(ksiF + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(l1 - l6) + L2F*sin(psiF) + l2Tx*cos(ksiF + ksiT + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK))) + l2T*sin(ksiF + ksiT + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK))))];
vx=[xH_d, xH_d + l1F*thetaF_d*cos(thetaF), xH_d + thetaK_d*(sin(ksiF + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(((l3*l4*sin(thetaK))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(thetaK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(thetaK)^2 + 1) - (l3*cos(thetaK))/sin(thetaK)^2))/((l3/sin(thetaK) - l4*cot(thetaK))^2 + l4^2))*(l1 - l6) - l1T*cos(ksiF + ksiT + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(((l3*l4*sin(thetaK))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(thetaK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(thetaK)^2 + 1) - (l3*cos(thetaK))/sin(thetaK)^2))/((l3/sin(thetaK) - l4*cot(thetaK))^2 + l4^2)) + l1Tx*sin(ksiF + ksiT + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(((l3*l4*sin(thetaK))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(thetaK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(thetaK)^2 + 1) - (l3*cos(thetaK))/sin(thetaK)^2))/((l3/sin(thetaK) - l4*cot(thetaK))^2 + l4^2)) + (l3*l4*cos(ksiF + thetaF + pi/2 + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*sin(thetaK))/(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2) + (l4*sin(ksiF + thetaF + pi/2 + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(l4*(cot(thetaK)^2 + 1) - (l3*cos(thetaK))/sin(thetaK)^2)*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))/((l3/sin(thetaK) - l4*cot(thetaK))^2 + l4^2)) - thetaF_d*(sin(ksiF + thetaF - pi/2)*(l3 - l6) + sin(ksiF + thetaF + pi/2 + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2) - L1F*cos(thetaF) + sin(ksiF + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))*(l1 - l6) - l1T*cos(ksiF + ksiT + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK))) + l1Tx*sin(ksiF + ksiT + thetaF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(thetaK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(thetaK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(thetaK) - l4*cot(thetaK)))), xH_d + l2F*psiF_d*cos(psiF), xH_d + psiK_d*(sin(ksiF + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(l1 - l6)*(((l3*l4*sin(psiK))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(psiK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(psiK)^2 + 1) - (l3*cos(psiK))/sin(psiK)^2))/((l3/sin(psiK) - l4*cot(psiK))^2 + l4^2)) - l2T*cos(ksiF + ksiT + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(((l3*l4*sin(psiK))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(psiK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(psiK)^2 + 1) - (l3*cos(psiK))/sin(psiK)^2))/((l3/sin(psiK) - l4*cot(psiK))^2 + l4^2)) + l2Tx*sin(ksiF + ksiT + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(((l3*l4*sin(psiK))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2)) - (l3*l4*sin(psiK)*(l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2))/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(3/2)))/(1 - (l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)^2/(l1^2*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)))^(1/2) + (l4*(l4*(cot(psiK)^2 + 1) - (l3*cos(psiK))/sin(psiK)^2))/((l3/sin(psiK) - l4*cot(psiK))^2 + l4^2)) + (l3*l4*cos(ksiF + psiF + pi/2 + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*sin(psiK))/(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2) + (l4*sin(ksiF + psiF + pi/2 + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(l4*(cot(psiK)^2 + 1) - (l3*cos(psiK))/sin(psiK)^2)*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))/((l3/sin(psiK) - l4*cot(psiK))^2 + l4^2)) - psiF_d*(sin(ksiF + psiF - pi/2)*(l3 - l6) + sin(ksiF + psiF + pi/2 + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2) - L2F*cos(psiF) + sin(ksiF + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK)))*(l1 - l6) - l2T*cos(ksiF + ksiT + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK))) + l2Tx*sin(ksiF + ksiT + psiF - pi/2 + acos((l1^2/2 - l2^2/2 + l3^2/2 - cos(psiK)*l3*l4 + l4^2/2)/(l1*(l3^2 - 2*cos(psiK)*l3*l4 + l4^2)^(1/2))) + atan2(l4, l3/sin(psiK) - l4*cot(psiK))))];

end

