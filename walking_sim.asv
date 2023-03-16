clc
clear
close all
% warning off all
rmpath(genpath('C:\Users\CSL\Desktop\NoTroll'))
addpath(genpath('C:\Users\CSL\Desktop\PseudoKlisi_4active'))
cd C:\Users\CSL\Desktop\PseudoKlisi_4active
%cd C:\Users\CSL\Desktop\NoTroll2
%addpath(genpath('Footshape'))

% Model parameters
Mall=10;
Lall=0.60;

solver.Num_of_steps=5;
 
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
%solver.Num_of_steps=apo panw
solver.verbose=1;

% Initial conditions
thetaF0=0.1240;         thetaF_d0=-0.8775;
thetaK0=0/180*pi;       thetaK_d0=0;
psiF0=-0.3141;          psiF_d0=0;
psiK0=0/180*pi;      psiK_d0=0;
thetaD0=-10/180*pi;      thetaD_d0=0;

% % Initial conditions
% thetaF0=7.1047/180*pi;         thetaF_d0=-0.8775;
% thetaK0=1/180*pi;       thetaK_d0=-0.0037;
% psiF0=-17.9966/180*pi;          psiF_d0=1.9556;
% psiK0=0.01/180*pi;      psiK_d0=2;
% thetaD0=0/180*pi;      thetaD_d0=0;

% % Initial conditions
% thetaF0=0.1240;         thetaF_d0=-0.8;
% thetaK0=1/180*pi;       thetaK_d0=0;
% psiF0=-0.3141;          psiF_d0=1.9;
% psiK0=0.01/180*pi;      psiK_d0=0;
% thetaD0=0/180*pi;      thetaD_d0=0;

% % Initial conditions
% thetaF0=0.1240;         thetaF_d0=-1.221;
% thetaK0=1/180*pi;       thetaK_d0=-0.904;
% psiF0=-0.3141;          psiF_d0=0.6951;
% psiK0=0.01/180*pi;      psiK_d0=0.94;
% thetaD0=0/180*pi;      thetaD_d0=0;

% % Initial conditions
% thetaF0=0.2453;         thetaF_d0=-2.5946;
% thetaK0=-2.8317e-04;       thetaK_d0=-1.2741;
% psiF0=-0.4081;          psiF_d0=-0.0234;
% psiK0=-0.0074;      psiK_d0=1.2888;
% thetaD0=-0.5642;      thetaD_d0=-1.1998;

% % Initial conditions
% thetaF0=0.2498;         thetaF_d0=-2.1437;
% thetaK0=-2.3945e-04;       thetaK_d0=-0.8091;
% psiF0=-0.4125;          psiF_d0=0.0348;
% psiK0=-0.0074;      psiK_d0=1.3379;
% thetaD0=-0.2035;      thetaD_d0=-1.1220;
%% ICs
q0=[thetaK0,psiK0,thetaF0,psiF0,thetaD0];
qd0=[thetaK_d0,psiK_d0,thetaF_d0,psiF_d0,thetaD_d0];
IC.q=q0;
IC.qd=qd0;

%% Pre-Processing
IC = calculate_xinit(parameters,footshape,IC);

%% For Adams Comparisons
%for_adams = knee_joint_velocities(parameters,IC);

%% Initialize simulation
results = initialize_simulation(IC);

% Define DAE options and solution events
events = define_ADE_events(parameters,footshape);
options = define_ADE_options(parameters,footshape,events,solver);

%% Perform walking
results = walking_steps(parameters,footshape,solver,options,results);


%% Plots
plot_results=1;

% Plot foot clearance
results = plot_foot_clearance(parameters,footshape,results,plot_results);

% Plot phase plane
%plot_phase_plane(results,plot_results)

% Find Lagrange multipliers - GRFs
results = decode_lagrange_multipliers(parameters,footshape,results,plot_results);

%% Animation

prepare_animation(parameters);
plot_misc.plot_step=0.1;
mov = plot_animation(parameters,footshape,results,plot_misc);
if not(isfolder('Videos'))
    mkdir('Videos') 
end
save_animation(mov,plot_misc.plot_step,'Videos\ConPerpEDW.mp4')


%%
ropes = Ropes_diag(parameters,footshape,results);
gonies = Gonies_diag(parameters,results);
%graphs4 = post_processing(parameters,results);