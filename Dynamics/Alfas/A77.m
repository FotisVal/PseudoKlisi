function Aij = A77(Icw,mcw,rcw,thetaD)
%A77
%    AIJ = A77(ICW,MCW,RCW,THETAD)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:44:08

t2 = rcw.^2;
Aij = Icw+(mcw.*(t2.*cos(thetaD).^2.*2.0+t2.*sin(thetaD).^2.*2.0))./2.0;
