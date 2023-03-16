function Bgi = Bg2(M,alfaA,alfaP,g,m1F,m2F,m1T,m2T,mcw)
%BG2
%    BGI = BG2(M,ALFAA,ALFAP,G,M1F,M2F,M1T,M2T,MCW)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:44:32

t2 = cos(alfaA);
t3 = cos(alfaP);
Bgi = -g.*(M.*t2+m1F.*t2+m2F.*t2+m1T.*t2+m2T.*t2+mcw.*t2)+g.*(M.*t3+m1F.*t3+m2F.*t3+m1T.*t3+m2T.*t3+mcw.*t3);
