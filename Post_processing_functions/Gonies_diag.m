function [gonies] = Gonies_diag(parameters,results)

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

        gonies.xi=[xH_i,yH_i,thetaK_i,psiK_i,thetaF_i,psiF_i,thetaD_i,xH_di,yH_di,thetaK_di,psiK_di,thetaF_di,psiF_di,thetaD_di]';

            Gon1(i)=gonies.xi(1); 
            Gon2(i)=gonies.xi(3);
            Gon3(i)=gonies.xi(4);
            Gon4(i)=gonies.xi(5);
            Gon5(i)=gonies.xi(6);
            Gon6(i)=gonies.xi(7);

            Gond1(i)=gonies.xi(8); 
            Gond2(i)=gonies.xi(10);
            Gond3(i)=gonies.xi(11);
            Gond4(i)=gonies.xi(12);
            Gond5(i)=gonies.xi(13);
            Gond6(i)=gonies.xi(14);


                
    end


    figure(6)

    plot(results.t,Gond1)
    hold on
    plot(results.t,Gond2)
    hold on
    plot(results.t,Gond3)
    hold on
    plot(results.t,Gond4)
    hold on
    plot(results.t,Gond5)
    hold on
    plot(results.t,Gond6)
    hold off

    legend('xH_d','thetaK_d','psiK_d','thetaF_d','psiF_d','thetaD_d');
    title('ΔΙΑΓΡΑΜΜΑ ΤΑΧΥΤΗΤΩΝ ΓΩΝΙΑΣ')
    xlabel('Χρόνος Βάδισης (s)') 
    ylabel('Ταχύτητες Γωνίας (rad/s)')
    %ylabel('Βαρυτικές Ροπές, $$ \frac{N}{m} $$','Interpreter','latex')



    figure(7)

    plot(results.t,Gon1)
    hold on
    plot(results.t,Gon2)
    hold on
    plot(results.t,Gon3)
    hold on
    plot(results.t,Gon4)
    hold on
    plot(results.t,Gon5)
    hold on
    plot(results.t,Gon6)
    hold off

    legend('xH','thetaK','psiK','thetaF','psiF','thetaD');
    title('ΔΙΑΓΡΑΜΜΑ ΓΩΝΙΩΝ')
    xlabel('Χρόνος Βάδισης (s)') 
    ylabel('Γωνίες (rad)')
    %ylabel('Βαρυτικές Ροπές, $$ \frac{N}{m} $$','Interpreter','latex')
    
end