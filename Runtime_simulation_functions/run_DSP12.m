function results = run_DSP12(parameters,footshape,solver,options,results)
 %calculate GRF at first instance
    Ls4x1a = GRF_DSP(results.intermediate.xinit,parameters,footshape);
    if Ls4x1a(2)>0
        % DSP1 ----------------------------------------------------------------
        txt=['Step Number ',num2str(solver.stepnum),' DSP12.'];
        if solver.verbose==1; disp(txt); end
        [t12,x12] = ode23t(@(ti,xi)  DSP_beta18x1(ti,xi,parameters,footshape), [0,0.001], results.intermediate.xinit, options.opt_DSP1);%!!!!!!!!!!!!!!
 
        Ls4x1b = GRF_DSP(x12(2,:)',parameters,footshape);
        if Ls4x1b(2)>0             
            results = export_results(t12,x12,parameters,results,12);
        else
            results.intermediate.xinit=results.intermediate.xinit(1:16);
            txt=['Step Number ',num2str(solver.stepnum),' : Woops! No DSP12 !'];
            if solver.verbose==1; disp(txt); end
        end
    else
        results.intermediate.xinit=results.intermediate.xinit(1:16);
    end
    
    results.events.TO2=[results.events.TO2; results.thetaF(end), results.thetaF_d(end), results.thetaK(end), results.thetaK_d(end)];
end