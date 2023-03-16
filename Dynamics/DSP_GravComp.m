function gravtor = DSP_GravComp(x,parameters,footshape)

% L7x2=Lamda_J(x,parameters,footshape);
% LT2x7=L7x2.';
% La=L7x2(1:2,1:4);
% Lb=L7x2(3:7,1:4);
% 
% Matrix_M7x7=mass7x7(x,parameters);
% matrixB7x1=beta7x1(x,parameters);
% invM7x7=(Matrix_M7x7)\eye(7);
% 
% Bg7x1=betaG7x1(x,parameters);
% 
% Fvades7x7=eye(7)-L7x2*inv(LT2x7*invM7x7*L7x2)*LT2x7*invM7x7;
% 
% Mg5x2=[Matrix_M7x7(3:7,1),Matrix_M7x7(3:7,2)];
% MgT2x5=Mg5x2.';
% Ma2x2=[Matrix_M7x7(1:2,1),Matrix_M7x7(1:2,2)];
% invMa2x2=(Ma2x2)\eye(2);
% Mb5x5=Matrix_M7x7(3:7,3:7);
% Men4x7=[Mg5x2*invMa2x2,-eye(5)];
% 
% det(Ma2x2)
% "k"
% det(Mb5x5-Mg5x2*invMa2x2*MgT2x5)
% "MB"
% inv(Mb5x5)
% 
% F=eye(5)-(Lb-Mg5x2*invMa2x2*La)*inv(LT2x7*invM7x7*L7x2)*LT2x7*[-invMa2x2*MgT2x5*inv(Mb5x5-Mg5x2*invMa2x2*MgT2x5);inv(Mb5x5-Mg5x2*invMa2x2*MgT2x5)];
% invF=F\eye(5);
% 
% Gdades4x7=invF*Men4x7*Fvades7x7;
% 
% Tor4x1=Gdades4x7*Bg7x1;
% gravtor(1)=Tor4x1(1);
% gravtor(2)=Tor4x1(2);
% gravtor(3)=Tor4x1(3);
% gravtor(4)=Tor4x1(4);
% gravtor(5)=-gravtor(3)-gravtor(4); 
% 
% syms ub1 ub2 ub3 ub4 ko5
% Ub=[ub1;ub2;ub3;ub4;ko5];
% U=[0;0;Ub];
% 
% L7x2=Lamda_J(x,parameters,footshape);
% LT2x7=L7x2.';
% La=L7x2(1:2,1:4);
% Lb=L7x2(3:7,1:4);
% 
% Matrix_M7x7=mass7x7(x,parameters);
% invM7x7=(Matrix_M7x7)\eye(7);
% Mg5x2=[Matrix_M7x7(3:7,1),Matrix_M7x7(3:7,2)];
% Ma2x2=[Matrix_M7x7(1:2,1),Matrix_M7x7(1:2,2)];
% invMa2x2=(Ma2x2)\eye(2);
% Men4x7=[Mg5x2*invMa2x2,-eye(5)];
% 
% Bg7x1=betaG7x1(x,parameters);
% 
% Fvades7x7=eye(7)-L7x2*inv(LT2x7*invM7x7*L7x2)*LT2x7*invM7x7;
% 
% KAP=[Lb-Mg5x2*invMa2x2*La]*inv([LT2x7*invM7x7*L7x2])*[LT2x7*invM7x7];
% 
% eqn=Ub+KAP*U==Men4x7*Fvades7x7*Bg7x1;
% Tim = solve(eqn,[ub1 ub2 ub3 ub4 ko5]);
% 
% gravtor(1)=Tim.ub1;
% gravtor(2)=Tim.ub2;
% gravtor(3)=Tim.ub3;
% gravtor(4)=Tim.ub4;
% gravtor(5)=-gravtor(3)-gravtor(4); 

    L7x2=Lamda_J(x,parameters,footshape);
    L6x2=L7x2(1:6,3:4);
    LT2x6=L6x2.';

    Matrix_M7x7=mass7x7(x,parameters);
    Matrix_M6x6=Matrix_M7x7(1:6,1:6);
    invM6x6=(Matrix_M6x6)\eye(6);

    Bg7x1=betaG7x1(x,parameters);
    Bg6x1=Bg7x1(1:6);

%     Mg4x2=[Matrix_M6x6(5:6,1),Matrix_M6x6(5:6,2),Matrix_M6x6(5:6,3),Matrix_M6x6(5:6,4)];
%     Ma2x2=[Matrix_M6x6(1:4,1),Matrix_M6x6(1:4,2),Matrix_M6x6(1:4,3),Matrix_M6x6(1:4,4)];
%     invMa2x2=(Ma2x2)\eye(4);
% 
%     Kst=[eye(4),zeros(4,2);-Mg4x2*invMa2x2,eye(2)];
%     Lst=L6x2*inv(LT2x6*invM6x6*L6x2)*LT2x6*invM6x6;
%     
%     Tor4x1=inv(-eye(6)+Kst*Lst)*Kst*(eye(6)-Lst)*Bg6x1;

    Mg4x2=[Matrix_M6x6(3:6,1),Matrix_M6x6(3:6,2)];
    Ma2x2=[Matrix_M6x6(1:2,1),Matrix_M6x6(1:2,2)];
    invMa2x2=(Ma2x2)\eye(2);

    Kst=[eye(2),zeros(2,4);-Mg4x2*invMa2x2,eye(4)];
    Lst=L6x2*inv(LT2x6*invM6x6*L6x2)*LT2x6*invM6x6;
    det(-eye(6)+Kst*Lst);
    
    Tor4x1=inv(-eye(6)+Kst*Lst)*Kst*(eye(6)-Lst)*Bg6x1;
    
    gravtor(1)=Tor4x1(3);
    gravtor(2)=Tor4x1(4);
    gravtor(3)=Tor4x1(5);
    gravtor(4)=Tor4x1(6);
    gravtor(5)=-gravtor(3)-gravtor(4);
end
