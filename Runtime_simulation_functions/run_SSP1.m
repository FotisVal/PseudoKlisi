function results = run_SSP1(parameters,solver,options,results,footshape)

    if results.fell==0
        txt=['Step Number ',num2str(solver.stepnum),' SSP1a.'];
        if solver.verbose==1; disp(txt); end
        %size(results.t)
        [t1_i,x1_i] = ode15s(@(ti,xi)  SSP1_beta16x1(ti,xi,parameters,footshape), solver.tspan, results.intermediate.xinit, options.opt_SSP1_i);%!!!!!!!!!!!!!!
%         if solver.stepnum==1;
%             for k=1:length(x1_i)
%                 Maza=mass7x7(x1_i(k,:),parameters);
%                 InvMaza=inv(Maza);
%                 BITA=SSP1_betaCon7x1(x1_i(k,:),parameters,footshape);
%                 Epi=InvMaza*BITA';
%                 Epitax(:,k)=Epi;
%                 results.xH_dd=Epitax(1,k)
%                 k
%             end
%         end
        results = export_results(t1_i,x1_i,parameters,results,1);
       
        [value,isterminal,direction] = HS_leg2(results.t,results.intermediate.xinit,parameters,footshape);
        
        if value<-0.01
            results.fell=1;
        end
        %size(results.t)
    end

    %
    if results.fell==0
        txt=['Step Number ',num2str(solver.stepnum),' SSP1b.'];
        if solver.verbose==1; disp(txt); end
        
        [t1_ii,x1_ii] = ode15s(@(ti,xi)  SSP1_beta16x1(ti,xi,parameters,footshape), solver.tspan, results.intermediate.xinit, options.opt_SSP1_ii);%!!!!!!!!!!!!!!
%         if solver.stepnum==1
%             for k=1:length(x1_ii)
%                 Maza=mass7x7(x1_ii(k,:),parameters);
%                 InvMaza=inv(Maza);
%                 BITA=SSP1_betaCon7x1(x1_ii(k,:),parameters,footshape);
%                 Epi=InvMaza*BITA';
%                 Epitax(:,k)=Epi;
%                 results.xH_dd=Epitax(1,k)
%             end
%         end
        results = export_results(t1_ii,x1_ii,parameters,results,1);
        [value,isterminal,direction] = HS_leg2(results.t,results.intermediate.xinit,parameters,footshape);
        if value<-0.01
            results.fell=1;
        end
        %size(results.t)
    end
    if results.fell==0
        txt=['Step Number ',num2str(solver.stepnum),' SSP1c.'];
        if solver.verbose==1; disp(txt); end
        [t1,x1] = ode15s(@(ti,xi)  SSP1_beta16x1(ti,xi,parameters,footshape), solver.tspan, results.intermediate.xinit, options.opt_SSP1);%!!!!!!!!!!!!!!
%         if solver.stepnum==1
%             for k=1:length(x1)
%                 Maza=mass7x7(x1(k,:),parameters);
%                 InvMaza=inv(Maza);
%                 BITA=SSP1_betaCon7x1(x1(k,:),parameters,footshape);
%                 Epi=InvMaza*BITA';
%                 Epitax(:,k)=Epi;
%                 results.xH_dd=Epitax(1,k)
%             end
%         end
        results = export_results(t1,x1,parameters,results,1);
        results.intermediate.xinit=[results.intermediate.xinit;0;0];
        
        results.events.HS2=[results.events.HS2; results.thetaF(end), results.thetaF_d(end), results.thetaK(end), results.thetaK_d(end)];
        
        [value,isterminal,direction] = HS_leg2(results.t,results.intermediate.xinit,parameters,footshape);
        if value<-0.01
            results.fell=1;
        end
        %size(results.t)
    end
end