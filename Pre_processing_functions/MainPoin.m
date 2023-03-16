clc
clear
close all
% warning off all
rmpath(genpath('C:\Users\CSL\Desktop\Matlab_files\ProPass'))
addpath(genpath('C:\Users\CSL\Desktop\Matlab_files\KormCon'))
cd C:\Users\CSL\Desktop\Matlab_files\KormCon
%addpath(genpath('Footshape'))

% Model parameters
Mall=10;
Lall=0.60;

parameters.mcw=1;       parameters.Rcw=0.4;      parameters.rcw=parameters.Rcw/2;     parameters.Icw=parameters.mcw*(parameters.rcw)^2;
parameters.M=Mall*(1-0.1*2-0.062*2)-parameters.mcw;
parameters.I=0;    
parameters.m1F=0.1*Mall;           parameters.I1F=parameters.m1F*(0.135*Lall)^2;   parameters.L1F=0.46*Lall;     parameters.l1F=0.2*Lall;   
parameters.m1T=0.062*Mall;         parameters.I1T=parameters.m1T*(0.186*Lall)^2;   parameters.L1T=0.54*Lall;     parameters.l1T=0.2352*Lall;  
parameters.l1Tx=0.0379*Lall; 
parameters.m2F=parameters.m1F;        parameters.I2F=parameters.I1F;            parameters.L2F=parameters.L1F;        parameters.l2F=parameters.l1F;      
parameters.m2T=parameters.m1T;        parameters.I2T=parameters.I1T;            parameters.L2T=parameters.L1T;        parameters.l2T=parameters.l1T;   
parameters.l2Tx=parameters.l1Tx;
parameters.l1=0.0305*Lall; parameters.l2=0.0322*Lall; parameters.l3=0.0128*Lall; parameters.l4=0.0299*Lall; parameters.l5=parameters.l1/2; parameters.l6=parameters.l3/2;
parameters.ksiF=(90-65)/180*pi;
parameters.ksiT=(90-14.73844)/180*pi;
parameters.alfaA=0/180*pi;    parameters.g=9.81;
parameters.alfaP=-2/180*pi;

parameters.k=880;
parameters.b=26;
% Knee angles (4 Bar) for stance and swing leg
parameters.knee_cap_angle=0/180*pi;

R=0.2*Lall;
er=0.3662;
footshape = create_footshape(er*180/pi,R,'Footshape\footshape3.mat');
[xi_x0,ix]=min(abs(footshape.x));
parameters.r0=abs(footshape.y(ix));

% Solver parameters
solver.tstart=0;
solver.tend=0.5;
solver.tspan =[solver.tstart,solver.tend];
solver.RelTol=10^-4;
solver.AbsTol=10^-4;
solver.MaxStep=0.001;
solver.Num_of_steps=1;
solver.verbose=1;


% Initial conditions
thetaF0=0.1240;         thetaF_d0=-0.8775;
thetaK0=1/180*pi;       thetaK_d0=-0.0037;
psiF0=-0.3141;          psiF_d0=1.9556;
psiK0=0.01/180*pi;      psiK_d0=2;
thetaD0=0/180*pi;      thetaD_d0=0;

%% Poincare Analytiko

Kappa=4;
aba=0;
while Kappa>10^-6 
aba=aba+1;
aba
% solver.RelTol=10^-4;
% solver.AbsTol=10^-4;
% solver.MaxStep=10^-3;
    %% ICs
q0=[thetaK0,psiK0,thetaF0,psiF0,thetaD0];
qd0=[thetaK_d0,psiK_d0,thetaF_d0,psiF_d0,thetaD_d0];
clear IC results
IC.q=q0;
IC.qd=qd0;

%% Pre-Processing
IC = calculate_xinit(parameters,footshape,IC);

%% Initialize simulation
results = initialize_simulation(IC);

% Define DAE options and solution events
events = define_ADE_events(parameters,footshape);
options = define_ADE_options(parameters,footshape,events,solver);
    
    P = RunPoin(parameters,footshape,solver,options,results);
    %xn=[results.thetaF(1),results.thetaF_d(1),results.psiF(1),results.psiF_d(1),...
        %results.thetaD(1),results.thetaD_d(1)];     
    xn=[results.thetaF(1),results.thetaF_d(1),results.psiF(1),results.psiF_d(1),...
    results.thetaD(1),results.thetaD_d(1)];

        
%% ΥΠΟΛ ΑΝΑΔΕΛΤΑ
solver.RelTol=10^-4;
solver.AbsTol=10^-4;
solver.MaxStep=10^-3;
    for i=1:1:length(xn)       
        % ΥΠΟΛ dx
        dx=zeros(1,6);
        dx(1,i)=10^-6;
        xplus=xn+dx;
        xminus=xn-dx;
        
        % ΥΠΟΛ plus and minus ΣΥΝΑΡΤ ΒΗΜΑΤΟΣ
        %PLUS
        
        % ICs
        q0=[thetaK0,psiK0,xplus(1),xplus(3),xplus(5)];
        qd0=[thetaK_d0,psiK_d0,xplus(2),xplus(4),xplus(6)];
        clear IC
        IC.q=q0;
        IC.qd=qd0;
        % Pre-Processing
        IC = calculate_xinit(parameters,footshape,IC);
        % Initialize simulation
        results = initialize_simulation(IC);
        % Define DAE options and solution events
        events = define_ADE_events(parameters,footshape);
        options = define_ADE_options(parameters,footshape,events,solver);

        % ΣΥΝΑΡΤ ΒΗΜΑΤΟΣ
        Pplus = RunPoin(parameters,footshape,solver,options,results);
        
        %MINUS
        
        % ICs
        q0=[thetaK0,psiK0,xminus(1),xminus(3),xminus(5)];
        qd0=[thetaK_d0,psiK_d0,xminus(2),xminus(4),xminus(6)];
        clear IC
        IC.q=q0;
        IC.qd=qd0;
        % Pre-Processing
        IC = calculate_xinit(parameters,footshape,IC);
        % Initialize simulation
        results = initialize_simulation(IC);
        % ΣΥΝΑΡΤ ΒΗΜΑΤΟΣ
        Pminus = RunPoin(parameters,footshape,solver,options,results);
    
        %ΥΠΟΛ dP/dxi
        dpdx=(Pplus-Pminus)/(2*dx(1,i));
        DPdx(:,i)=dpdx;
    end
     
    %NR
    xnew = xn' + 0.1*inv(eye(6)-DPdx)*(P-xn)';
    
    
    %Condition of loop
    AN=xnew-xn;
    Kappa=max(abs(AN));
    
    % Initial conditions
    xnew
    thetaF0=xnew(1)         
    thetaF_d0=xnew(2)
    psiF0=xnew(3)          
    psiF_d0=xnew(4)
    thetaD0=xnew(5)      
    thetaD_d0=xnew(6)

end
