function results = decode_lagrange_multipliers(parameters,footshape,results,plot_results)
% %Ground force calculation

    for i=1:1:length(results.thetaF)
    
        xH_i=results.xH(i);
        yH_i=results.yH(i);
        thetaF_i = results.thetaF(i);
        thetaK_i = results.thetaK(i);
        psiF_i = results.psiF(i);
        psiK_i = results.psiK(i);
        thetaD_i = results.thetaD(i);
    
        xH_di=results.xH_d(i);
        yH_di=results.yH_d(i);
        thetaF_di = results.thetaF_d(i);
        thetaK_di = results.thetaK_d(i);
        psiF_di = results.psiF_d(i);
        psiK_di = results.psiK_d(i);
        thetaD_di = results.thetaD_d(i);
    
        xi=[xH_i,yH_i,thetaK_i,psiK_i,thetaF_i,psiF_i,thetaD_i,xH_di,yH_di,thetaK_di,psiK_di,thetaF_di,psiF_di,thetaD_di]';
        %
        % qi=x(1:6);
        qdoti=[xi(8:14)];
    
        if results.phase(i)==1
            L7x2=Lamda1_J(xi,parameters,footshape);
            Ld7x2=Lamda1_dot_J(xi,parameters,footshape);
            LT2x7=L7x2.';
    
            Matrix_M7x7=mass7x7(xi,parameters);
            matrixB7x1=beta7x1(xi,parameters);
            invM7x7=(Matrix_M7x7)\eye(7);
    
            lamdas2x1=-inv(LT2x7*invM7x7*L7x2)*((Ld7x2.')*qdoti+LT2x7*invM7x7*matrixB7x1);
            results.lamda1(i)=lamdas2x1(1);
            results.lamda2(i)=lamdas2x1(2);
            results.lamda3(i)=0;
            results.lamda4(i)=0;
            qdd=invM7x7*(matrixB7x1+L7x2*lamdas2x1);
            results.qdotdot(:,i)=qdd;
                    
        elseif results.phase(i)==2
            L7x2=Lamda2_J(xi,parameters,footshape);
            Ld7x2=Lamda2_dot_J(xi,parameters,footshape);
            LT2x7=L7x2.';
    
            Matrix_M7x7=mass7x7(xi,parameters);
            matrixB7x1=beta7x1(xi,parameters);
            invM7x7=(Matrix_M7x7)\eye(7);
    
            lamdas2x1=-inv(LT2x7*invM7x7*L7x2)*((Ld7x2.')*qdoti+LT2x7*invM7x7*matrixB7x1);
            results.lamda1(i)=0;
            results.lamda2(i)=0;
            results.lamda3(i)=lamdas2x1(1);
            results.lamda4(i)=lamdas2x1(2);
            qdd=invM7x7*(matrixB7x1+L7x2*lamdas2x1);
            results.qdotdot(:,i)=qdd;
            
        else
            L6x4=Lamda_J(xi,parameters,footshape);
            Ld6x4=Lamda_dot_J(xi,parameters,footshape);
            LT4x6=L6x4.';
    
            Matrix_M7x7=mass7x7(xi,parameters);
            matrixB7x1=beta7x1(xi,parameters);
            invM7x7=(Matrix_M7x7)\eye(7);
    
            lamdas4x1=-inv(LT4x6*invM7x7*L6x4)*((Ld6x4.')*qdoti+LT4x6*invM7x7*matrixB7x1);
            results.lamda1(i)=lamdas4x1(1);
            results.lamda2(i)=lamdas4x1(2);
            results.lamda3(i)=lamdas4x1(3);
            results.lamda4(i)=lamdas4x1(4);
            qdd=invM7x7*(matrixB7x1+L6x4*lamdas4x1);
            results.qdotdot(:,i)=qdd;
            
            
        end
    end
    
    if plot_results==1
        figure(4)
        plot(results.t,results.lamda2)
        hold on
        plot(results.t,results.lamda4)
        title('Ground Reaction Forces')
        xlabel('t [s]')
        ylabel('GRF [N]')
        % plot(t,phase*100)
    end
    
end