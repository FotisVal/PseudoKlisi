function results = initialize_simulation(IC)

    xinit=IC.xinit;
    results.intermediate.xinit=IC.xinit;

    results.t=0;
    results.intermediate.t0=0;
    results.intermediate.xinit=IC.xinit;

    results.phase=1;
    
    results.xH=xinit(1);    results.thetaF=xinit(5);    results.psiF=xinit(6);
    results.xH_d=xinit(8);  results.thetaF_d=xinit(12);  results.psiF_d=xinit(13);
    results.yH=xinit(2);    results.thetaK=xinit(3);    results.psiK=xinit(4);      results.thetaD=xinit(7);
    results.yH_d=xinit(9);  results.thetaK_d=xinit(10); results.psiK_d=xinit(11);   results.thetaD_d=xinit(14);
    results.thetaT=IC.below_knee(1);    results.psiT=IC.below_knee(2);
    results.thetaT_d=IC.below_knee(3);  results.psiT_d=IC.below_knee(4);
    results.events.HS1=[];
    results.events.TO1=[];
    results.events.HS2=[];
    results.events.TO2=[];
end