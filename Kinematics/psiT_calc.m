function psiT = psiT_calc(ksiF,ksiT,l1,l2,l3,l4,psiF,psiK)
%PSIT_CALC
%    PSIT = PSIT_CALC(KSIF,KSIT,L1,L2,L3,L4,PSIF,PSIK)

%    This function was generated by the Symbolic Math Toolbox version 8.7.
%    02-Dec-2022 15:43:40

t2 = cos(psiK);
t3 = l3.^2;
t4 = l4.^2;
psiT = ksiF+ksiT+psiF+atan2(l4.*sin(psiK),l3-l4.*t2)+acos((1.0./sqrt(t3+t4-l3.*l4.*t2.*2.0).*(t3./2.0+t4./2.0+l1.^2./2.0-l2.^2./2.0-l3.*l4.*t2))./l1);

psiT=wrapToPi(psiT);