function P = RunPoin(parameters,footshape,solver,options,results)

    results.fell=0;
    stepnum=1;
        
            solver.stepnum=stepnum;
            txt=['-'];
            if solver.verbose==1; disp(txt); end
            % SSP1-------------------------------------------------------------
            results = run_SSP1(parameters,solver,options,results,footshape);
            %check above ground
            [value,isterminal,direction] = HS_leg2(results.t,results.intermediate.xinit,parameters,footshape);
            % DSP12
            if results.fell==0
               results = run_DSP12(parameters,footshape,solver,options,results);
            end
            
            
   
    
   xmid=[results.xH(end),results.xH_d(end),results.yH(end),results.yH_d(end),results.thetaK(end),results.thetaK_d(end),results.psiK(end),results.psiK_d(end),...
        results.thetaF(end),results.thetaF_d(end),results.psiF(end),results.psiF_d(end),...
        results.thetaD(end),results.thetaD_d(end)];
        % Initial conditions
    
    xH0=xmid(1);            xH_d0=xmid(2);    
    yH0=xmid(3);            yH_d0=xmid(4); 
    thetaF0=xmid(11);         thetaF_d0=xmid(12);
    thetaK0=xmid(7);       thetaK_d0=xmid(8);
    psiF0=xmid(9);          psiF_d0=xmid(10);
    psiK0=xmid(5);      psiK_d0=xmid(6);
    thetaD0=xmid(13);      thetaD_d0=xmid(14);
    
    P=[thetaF0,thetaF_d0,psiF0,psiF_d0,thetaD0,thetaD_d0];
    
end