function results = run_DSP21(parameters,footshape,solver,options,results)

    Ls4x1a = GRF_DSP(results.intermediate.xinit,parameters,footshape);
        if Ls4x1a(4)>0
            % DSP2 ----------------------------------------------------------------
            txt=['Step Number ',num2str(solver.stepnum),' DSP21.'];
            if solver.verbose==1; disp(txt); end
            [t21,x21] = ode23t(@(ti,xi)  DSP_beta18x1(ti,xi,parameters,footshape),[0,0.001], results.intermediate.xinit, options.opt_DSP2);%!!!!!!!!!!!!!!
    
            Ls4x1b = GRF_DSP(x21(2,:)',parameters,footshape);
            if Ls4x1b(4)>0 
    
                % Export states
                results = export_results(t21,x21,parameters,results,21);
            else
                results.intermediate.xinit=results.intermediate.xinit(1:16);
                txt=['Step Number ',num2str(solver.stepnum),' : Woops! No DSP21 !'];
                if solver.verbose==1; disp(txt); end
            end
        else 
            results.intermediate.xinit=results.intermediate.xinit(1:16);
        end
        
        results.events.TO1=[results.events.TO1; results.thetaF(end), results.thetaF_d(end),results.thetaK(end), results.thetaK_d(end)];
end