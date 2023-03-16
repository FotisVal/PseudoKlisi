function options = define_ADE_options(parameters,footshape,events,solver)
    
    options.opt_SSP1_i = odeset('Mass',@(ti,xi) SSP1_mass16x16(ti,xi,parameters,footshape),'Events',events.hs2_i,'RelTol',solver.RelTol,'AbsTol',solver.AbsTol,'MaxStep',solver.MaxStep);
    options.opt_SSP1_ii = odeset('Mass',@(ti,xi) SSP1_mass16x16(ti,xi,parameters,footshape),'Events',events.hs2_ii,'RelTol',solver.RelTol,'AbsTol',solver.AbsTol,'MaxStep',solver.MaxStep);
    options.opt_SSP1 = odeset('Mass',@(ti,xi) SSP1_mass16x16(ti,xi,parameters,footshape),'Events',events.hs2,'RelTol',solver.RelTol,'AbsTol',solver.AbsTol,'MaxStep',solver.MaxStep);
    %
    options.opt_DSP1 = odeset('Mass',@(ti,xi) DSP_mass18x18(ti,xi,parameters,footshape),'Events',events.to1,'RelTol',solver.RelTol,'AbsTol',solver.AbsTol,'MaxStep',solver.MaxStep);
    %
    options.opt_SSP2_i = odeset('Mass',@(ti,xi) SSP2_mass16x16(ti,xi,parameters,footshape),'Events',events.hs1_i,'RelTol',solver.RelTol,'AbsTol',solver.AbsTol,'MaxStep',solver.MaxStep);
    options.opt_SSP2_ii = odeset('Mass',@(ti,xi) SSP2_mass16x16(ti,xi,parameters,footshape),'Events',events.hs1_ii,'RelTol',solver.RelTol,'AbsTol',solver.AbsTol,'MaxStep',solver.MaxStep);
    options.opt_SSP2 = odeset('Mass',@(ti,xi) SSP2_mass16x16(ti,xi,parameters,footshape),'Events',events.hs1,'RelTol',solver.RelTol,'AbsTol',solver.AbsTol,'MaxStep',solver.MaxStep);
    %
    options.opt_DSP2 = odeset('Mass',@(ti,xi) DSP_mass18x18(ti,xi,parameters,footshape),'Events',events.to2,'RelTol',solver.RelTol,'AbsTol',solver.AbsTol,'MaxStep',solver.MaxStep);

end