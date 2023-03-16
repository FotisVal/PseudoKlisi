function events = define_ADE_events(parameters,footshape)
    events.hs1_i = @(t, x) HS_leg1_i(t,x,parameters,footshape);
    events.hs1_ii = @(t, x) HS_leg1_ii(t,x,parameters,footshape);
    events.hs1 = @(t, x) HS_leg1(t,x,parameters,footshape);

    events.hs2_i = @(t, x) HS_leg2_i(t,x,parameters,footshape);
    events.hs2_ii = @(t, x) HS_leg2_ii(t,x,parameters,footshape);
    events.hs2 = @(t, x) HS_leg2(t,x,parameters,footshape);

    events.to1 = @(t, x) TO_leg1(t,x,parameters,footshape);
    events.to2 = @(t, x) TO_leg2(t,x,parameters,footshape);
end