function [ropes] = Ropes_diag(parameters,footshape,results)

    M=parameters.M;
    mcw=parameters.mcw;     
    m1F=parameters.m1F;     m1T=parameters.m1T;     m2F=parameters.m2F;     m2T=parameters.m2T;

    I=parameters.I;         Icw=parameters.Icw;     
    I1F=parameters.I1F;     I1T=parameters.I1T;     I2F=parameters.I2F;     I2T=parameters.I2T;

    L1F=parameters.L1F;     L1T=parameters.L1T;     L2F=parameters.L2F;     L2T=parameters.L2T;
    l1F=parameters.l1F;     l1T=parameters.l1T;     l2F=parameters.l2F;     l2T=parameters.l2T;
    l1Tx=parameters.l1Tx;   l2Tx=parameters.l2Tx;   
    l1=parameters.l1;       l2=parameters.l2;       l3=parameters.l3;   l4=parameters.l4;   l5=parameters.l5;   l6=parameters.l6;
    rcw=parameters.rcw;     
    ksiF=parameters.ksiF;   ksiT=parameters.ksiT;
    alfaA=parameters.alfaA;   g=parameters.g;

    
   
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
        
       if results.phase(i)==1
           k=1;
       elseif results.phase(i)==2   
           k=2;
       else 
           k=0;
       end
       
            ropes.R=Elegxos5x1(xi,k,parameters,footshape);
            Tor1(i)=ropes.R(1);
            Tor2(i)=ropes.R(2);
            Tor3(i)=ropes.R(3);
            Tor4(i)=ropes.R(4);
            Tor5(i)=ropes.R(5);

            
            cot(i)=(abs(Tor1(i))*abs(thetaF_di-thetaD_di)+abs(Tor2(i))*abs(psiF_di-thetaD_di))/(10*g*xH_di);
%             abs(Tor3(i))*abs(thetaF_di-thetaD_di)
                
    end

    CoT=sum(cot)/length(cot)

    
    figure(5)

    
    plot(results.t,Tor1)
    hold on
    plot(results.t,Tor2)
    hold on
    plot(results.t,Tor3)
    hold on
    plot(results.t,Tor4)
    hold on
    plot(results.t,Tor5)
    hold off

    %figure(6) 
    %plot(results.t,cot)



    legend('TorthK','TorpsiK','TorthF','TorpsiF','Torcw');
    title('ΔΙΑΓΡΑΜΜΑ ΡΟΠΩΝ')
    xlabel('Χρόνος Βάδισης (s)') 
    ylabel('Βαρυτικές Ροπές (N/m)')
    %ylabel('Βαρυτικές Ροπές, $$ \frac{N}{m} $$','Interpreter','latex')
    
end


