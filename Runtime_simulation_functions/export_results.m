function [results] = export_results(t,x,parameters,results,phase_id)

    % Export states
    xH=x(:,1);
    yH=x(:,2);
    thetaK = x(:,3);
    psiK = x(:,4);
    thetaF = x(:,5);
    psiF = x(:,6);
    thetaD = x(:,7);
    
    xH_d = x(:,8);
    yH_d =x(:,9);
    thetaK_d = x(:,10);
    psiK_d = x(:,11);
    thetaF_d = x(:,12);
    psiF_d = x(:,13);
    thetaD_d = x(:,14);

    t_tot=t + results.intermediate.t0;
    results.t=[results.t; t_tot];
    results.intermediate.t0=max(results.t);

    results.xH=[results.xH; xH];
    results.yH=[results.yH; yH];

    results.xH_d=[results.xH_d; xH_d];
    results.yH_d=[results.yH_d;yH_d];

    results.thetaF=[results.thetaF;thetaF];
    results.thetaF_d=[results.thetaF_d;thetaF_d];

    results.thetaK=[results.thetaK;thetaK];
    results.thetaK_d=[results.thetaK_d;thetaK_d];
    
    results.thetaD=[results.thetaD;thetaD];
    results.thetaD_d=[results.thetaD_d;thetaD_d];

    results.psiF=[results.psiF;psiF];
    results.psiF_d=[results.psiF_d;psiF_d];

    results.psiK=[results.psiK;psiK];
    results.psiK_d=[results.psiK_d;psiK_d];


    l1=parameters.l1;
    l2=parameters.l2;
    l3=parameters.l3;
    l4=parameters.l4;
    ksiF=parameters.ksiF;
    ksiT=parameters.ksiT;
    results.thetaT=[results.thetaT;thetaT_calc(ksiF,ksiT,l1,l2,l3,l4,thetaF,thetaK)];
    results.psiT=[results.psiT;psiT_calc(ksiF,ksiT,l1,l2,l3,l4,psiF,psiK)];
    results.thetaT_d=[results.thetaT_d;thetaT_d_calc(l1,l2,l3,l4,thetaK,thetaF_d,thetaK_d)];
    results.psiT_d=[results.psiT_d;psiT_d_calc(l1,l2,l3,l4,psiK,psiF_d,psiK_d)];
    results.phase=[results.phase;phase_id*ones(size(thetaF))];

    qi=x(end,1:7);
    qdoti=x(end,8:14);
    results.intermediate.xinit=[qi,qdoti,0,0]';

end