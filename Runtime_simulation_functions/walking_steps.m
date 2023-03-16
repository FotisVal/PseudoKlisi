function results = walking_steps(parameters,footshape,solver,options,results)

    results.fell=0;
    for stepnum=1:1:solver.Num_of_steps
        
            solver.stepnum=stepnum;
            txt=['-'];
            if solver.verbose==1; disp(txt); end
            % SSP1-------------------------------------------------------------
            results = run_SSP1(parameters,solver,options,results,footshape);
            %check above ground
            [value,isterminal,direction] = HS_leg2(results.t,results.intermediate.xinit,parameters,footshape);
            if results.fell==1
                break
            end
            % DSP12
            results = run_DSP12(parameters,footshape,solver,options,results);
            
            % SSP2 ------------------------------------------------------------
            txt=['-'];
            if solver.verbose==1; disp(txt); end
            results = run_SSP2(parameters,solver,options,results,footshape);
            % check above ground
            [value,isterminal,direction] = HS_leg1(results.t,results.intermediate.xinit,parameters,footshape);
            if results.fell==1
                break
            end
            %DSP21
            results = run_DSP21(parameters,footshape,solver,options,results); 
        
    end
    results.Nsteps=stepnum;
    txt=['-- Acheived ',num2str(stepnum),' steps.'];
    %if solver.verbose==1; disp(txt); end
    disp(txt);
end