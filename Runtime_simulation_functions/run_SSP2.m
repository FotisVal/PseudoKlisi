function results = run_SSP2(parameters,solver,options,results,footshape)
    

    if results.fell==0
        txt=strcat('Step Number ',num2str(solver.stepnum),' SSP2a.');
        if solver.verbose==1; disp(txt); end
        
        [t2_i,x2_i] = ode23t(@(ti,xi)  SSP2_beta16x1(ti,xi,parameters,footshape), solver.tspan, results.intermediate.xinit, options.opt_SSP2_i);%!!!!!!!!!!!!!!
    
        % Export states
        results = export_results(t2_i,x2_i,parameters,results,2);

        [value,isterminal,direction] = HS_leg1(results.t,results.intermediate.xinit,parameters,footshape);
        if value<-0.01
            results.fell=1;
        end
        %size(results.t)
    end
    
    %
    if results.fell==0
        txt=['Step Number ',num2str(solver.stepnum),' SSP2b.'];
        if solver.verbose==1; disp(txt); end
        [t2_ii,x2_ii] = ode23t(@(ti,xi)  SSP2_beta16x1(ti,xi,parameters,footshape), solver.tspan, results.intermediate.xinit, options.opt_SSP2_ii);%!!!!!!!!!!!!!!
    
        % Export states
        results = export_results(t2_ii,x2_ii,parameters,results,2);
        [value,isterminal,direction] = HS_leg1(results.t,results.intermediate.xinit,parameters,footshape);
        if value<-0.01
            results.fell=1;
        end
        %size(results.t)
    end
        
    %
    if results.fell==0
        txt=['Step Number ',num2str(solver.stepnum),' SSP2c.'];
        if solver.verbose==1; disp(txt); end
        [t2,x2] = ode23t(@(ti,xi)  SSP2_beta16x1(ti,xi,parameters,footshape), solver.tspan, results.intermediate.xinit, options.opt_SSP2);%!!!!!!!!!!!!!!
    
        results = export_results(t2,x2,parameters,results,2);
        results.intermediate.xinit=[results.intermediate.xinit;0;0];
        
        results.events.HS1=[results.events.HS1; results.thetaF(end), results.thetaF_d(end),results.thetaK(end), results.thetaK_d(end)];
        [value,isterminal,direction] = HS_leg1(results.t,results.intermediate.xinit,parameters,footshape);
        if value<-0.01
            results.fell=1;
        end
        %size(results.t)
    end

end