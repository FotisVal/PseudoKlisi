function Bgi = Bg7(alfaA,alfaP,g,mcw,rcw,thetaD)
%BG7
%    BGI = BG7(ALFAA,ALFAP,G,MCW,RCW,THETAD)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:44:35

t2 = cos(thetaD);
t3 = sin(thetaD);
Bgi = -g.*mcw.*(rcw.*t2.*cos(alfaA)-rcw.*t3.*sin(alfaA))+g.*mcw.*(rcw.*t2.*cos(alfaP)-rcw.*t3.*sin(alfaP));
