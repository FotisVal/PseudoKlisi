function gravtor = SSP1_GravComp(x,parameters,footshape)
% %Gravity Compensation | Underactuated Robots

    L7x2=Lamda1_J(x,parameters,footshape);
    L6x2=L7x2(1:6,1:2);
    LT2x6=L6x2.';

    Matrix_M7x7=mass7x7(x,parameters);
    Matrix_M6x6=Matrix_M7x7(1:6,1:6);
    invM6x6=(Matrix_M6x6)\eye(6);

    Bg7x1=betaG7x1(x,parameters);
    Bg6x1=Bg7x1(1:6);

    Mg4x2=[Matrix_M6x6(3:6,1),Matrix_M6x6(3:6,2)];
    Ma2x2=[Matrix_M6x6(1:2,1),Matrix_M6x6(1:2,2)];
    invMa2x2=(Ma2x2)\eye(2);

    Kst=[eye(2),zeros(2,4);-Mg4x2*invMa2x2,eye(4)];
    Lst=L6x2*inv(LT2x6*invM6x6*L6x2)*LT2x6*invM6x6;
    
    PinA=[-Mg4x2*invMa2x2,eye(4)]*[eye(6)-Lst];
    NA=null(PinA);
    NB=Bg7x1(1:2);
    x1=NA(1:6,1);
    x2=NA(1:6,2);
    


    xx1=NA(1:2,1);
    xx2=NA(1:2,2);
    
    NAA=[xx1,xx2];

    idioA=linsolve(NAA,NB);


    gravtor(1)=x1(3)*idioA(1)+x2(3)*idioA(2)-Bg6x1(3);
    gravtor(2)=x1(4)*idioA(1)+x2(4)*idioA(2)-Bg6x1(4);
    gravtor(3)=x1(5)*idioA(1)+x2(5)*idioA(2)-Bg6x1(5);
    gravtor(4)=x1(6)*idioA(1)+x2(6)*idioA(2)-Bg6x1(6);
    gravtor(5)=-gravtor(3)-gravtor(4);

end

% function gravtor = SSP1_GravComp(x,parameters,footshape)
% % %Gravity Compensation | Underactuated Robots
% 
%     L7x2=Lamda1_J(x,parameters,footshape);
%     L6x2=L7x2(1:6,1:2);
%     LT2x6=L6x2.';
% 
%     Matrix_M7x7=mass7x7(x,parameters);
%     Matrix_M6x6=Matrix_M7x7(1:6,1:6)
%     invM6x6=(Matrix_M6x6)\eye(6);
% 
%     Bg7x1=betaG7x1(x,parameters);
%     Bg6x1=Bg7x1(1:6)
%     NB=Bg7x1(1:4);
% 
%     Mg4x2=[Matrix_M6x6(5:6,1),Matrix_M6x6(5:6,2),Matrix_M6x6(5:6,3),Matrix_M6x6(5:6,4)]
%     Ma2x2=[Matrix_M6x6(1:4,1),Matrix_M6x6(1:4,2),Matrix_M6x6(1:4,3),Matrix_M6x6(1:4,4)]
%     invMa2x2=(Ma2x2)\eye(4)
% 
%     Kst=[eye(4),zeros(4,2);-Mg4x2*invMa2x2,eye(2)]
%     Lst=L6x2*inv(LT2x6*invM6x6*L6x2)*LT2x6*invM6x6;
%     
%     Tor4x1=inv(-eye(6)+Kst*Lst)*Kst*(eye(6)-Lst)*Bg6x1
% 
% 
%     PinA=[-Mg4x2*invMa2x2,eye(2)]*[eye(6)-Lst];
%     NA=null(PinA);
%     x1=NA(1:6,1);
%     x2=NA(1:6,2);
%     x3=NA(1:6,3);
%     x4=NA(1:6,4);
% 
% 
%     xx1=NA(1:4,1);
%     xx2=NA(1:4,2);
%     xx3=NA(1:4,3);
%     xx4=NA(1:4,4);
%     NAA=[xx1,xx2,xx3,xx4];
% 
%     idioA=linsolve(NAA,NB);
% 
% 
%     kappa(1)=x1(5)*idioA(1)+x2(5)*idioA(2)+x3(5)*idioA(3)+x4(5)*idioA(4)-Bg6x1(5);
%     kappa(2)=x1(6)*idioA(1)+x2(6)*idioA(2)+x3(6)*idioA(3)+x4(6)*idioA(4)-Bg6x1(6);
% 
% 
%     
%     gravtor(1)=Tor4x1(3);
%     gravtor(2)=Tor4x1(4);
%     gravtor(3)=Tor4x1(5);
%     gravtor(4)=Tor4x1(6);
%     gravtor(5)=-gravtor(3)-gravtor(4);
% 
% end