function  plot_phase_plane(results,plot_results)
    if plot_results==1
        figure(3)
        subplot(1,2,1)
        plot(results.thetaF,results.thetaF_d,'--')
        title('Hip angle phase space')
        xlabel('\theta_U')
        ylabel('\theta_Udot')
        hold on
        plot(results.thetaF(1),results.thetaF_d(1),'o')
        plot(results.events.HS1(:,1),results.events.HS1(:,2),'x')
        plot(results.events.TO1(:,1),results.events.TO1(:,2),'x')
        plot(results.events.HS2(:,1),results.events.HS2(:,2),'x')
        plot(results.events.TO2(:,1),results.events.TO2(:,2),'x')
        subplot(1,2,2)
        plot(results.thetaK,results.thetaK_d,'--')
        title('Knee angle phase space')
        xlabel('\theta_K')
        ylabel('\theta_Kdot')
        hold on
        plot(results.thetaK(1),results.thetaK_d(1),'o')
        plot(results.events.HS1(:,3),results.events.HS1(:,4),'x')
        plot(results.events.TO1(:,3),results.events.TO1(:,4),'x')
        plot(results.events.HS2(:,3),results.events.HS2(:,4),'x')
        plot(results.events.TO2(:,3),results.events.TO2(:,4),'x')
    end
end