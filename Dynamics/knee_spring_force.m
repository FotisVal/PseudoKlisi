function [u] = knee_spring_force(x,param)

% Define the control scheme used for the biped
% Current scheme: gravity compensation control

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


knee_cap_angle = param.knee_cap_angle;
knees=[thetaK,psiK];
knees_cap=knees<=knee_cap_angle;

UthK=knees_cap(1)*(-param.k*(thetaK-knee_cap_angle) - param.b*thetaK_d);
UpsK=knees_cap(2)*(-param.k*(psiK  -knee_cap_angle) - param.b*psiK_d);

% plot(180/pi*thetaK,knees_cap(1)*(-param.KP*(thetaK-knee_cap_angle/180*pi)),'k.')
% hold on
% plot(180/pi*psiK,knees_cap(2)*(-param.KP*(psiK  -knee_cap_angle/180*pi)),'b.')
% drawnow
u=[0,0,UthK,UpsK,0,0,0]';

end

