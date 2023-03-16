function footshape= create_footshape(foot_center_angle,radius,name)

% foot_center_angle=20.9820;
theta=-foot_center_angle*pi/180:1*pi/180:foot_center_angle*pi/180;
% radius=0.1092;
xdata=radius*sin(theta);
ydata=-radius*cos(theta);

xdata=xdata-min(xdata);
ydata=ydata-max(ydata);
x0=xdata;
y0=ydata;

%


p = polyfit(xdata,ydata,7);
x = linspace(min(xdata),max(xdata),1000);
y = polyval(p,x);

% figure
% plot(x,y,'o')
% hold on
% plot(x0,y0,'r.')
% axis equal 

%Prepare angles;
x_fis=x;
y_fis=y;
fis=atan2(y,x);

thetas0=atan(diff(y)./diff(x));
x_thetas0=x(1:end-1)+diff(x)/2;
y_thetas0=y(1:end-1)+diff(y)/2;

thetas1=[-pi/2:mean(abs(diff(thetas0))):min(thetas0),thetas0,max(thetas0):mean(abs(diff(thetas0))):pi/2];
x_thetas1=[ones(size(-pi/2:mean(abs(diff(thetas0))):min(thetas0)))*x_thetas0(1),x_thetas0,ones(size(max(thetas0):mean(abs(diff(thetas0))):pi/2))*x_thetas0(end)];
y_thetas1=[ones(size(-pi/2:mean(abs(diff(thetas0))):min(thetas0)))*y_thetas0(1),y_thetas0,ones(size(max(thetas0):mean(abs(diff(thetas0))):pi/2))*y_thetas0(end)];

[thetas, index] = unique(thetas1); 
x_thetas = x_thetas1(index);
y_thetas = y_thetas1(index);

psis=-thetas;
x_psis=x_thetas;
y_psis=y_thetas;

dx_dthetas=diff(x_thetas)./diff(thetas);
dy_dthetas=diff(y_thetas)./diff(thetas);
thetas_dxy_dth=thetas(1:end-1)+diff(thetas)/2;

dx_dpsis=diff(x_psis)./diff(psis);
dy_dpsis=diff(y_psis)./diff(psis);
psis_dxy_dps=psis(1:end-1)+diff(psis)/2;

% interpolated vectors
theta_vector=thetas_dxy_dth;
psi_vector=psis_dxy_dps;
x_vector=interp1(thetas,x_thetas,theta_vector,'linear');
y_vector=interp1(thetas,y_thetas,theta_vector,'linear');
fi_vector=interp1(x_fis,fis,x_vector,'linear');
dx_dth_vector=dx_dthetas;
dy_dth_vector=dy_dthetas;

dx_dps_vector=dx_dpsis;
dy_dps_vector=dy_dpsis;

dxc1_dth=sqrt((dx_dth_vector).^2+(dy_dth_vector).^2)+...
    -cos(theta_vector-fi_vector)/2.*(2*x_vector.*dx_dth_vector+2*y_vector.*dy_dth_vector)./sqrt(x_vector.^2+y_vector.^2)+...
    +sin(theta_vector-fi_vector).*sqrt(x_vector.^2+y_vector.^2).*(1-(dy_dth_vector.*x_vector-dx_dth_vector.*y_vector)./(x_vector.^2+y_vector.^2));
dyc1_dth=sin(theta_vector-fi_vector)/2.*(2*x_vector.*dx_dth_vector+2*y_vector.*dy_dth_vector)./sqrt(x_vector.^2+y_vector.^2)+...
    +cos(theta_vector-fi_vector).*sqrt(x_vector.^2+y_vector.^2).*(1-(dy_dth_vector.*x_vector-dx_dth_vector.*y_vector)./(x_vector.^2+y_vector.^2));

dxc2_dps=-sqrt((dx_dps_vector).^2+(dy_dps_vector).^2)+...
    -cos(-fi_vector-psi_vector)/2.*(2*x_vector.*dx_dps_vector+2*y_vector.*dy_dps_vector)./sqrt(x_vector.^2+y_vector.^2)+...
    +sin(-psi_vector-fi_vector).*sqrt(x_vector.^2+y_vector.^2).*(-1-(dy_dps_vector.*x_vector-dx_dps_vector.*y_vector)./(x_vector.^2+y_vector.^2));

dyc2_dps=sin(-psi_vector-fi_vector)/2.*(2*x_vector.*dx_dps_vector+2*y_vector.*dy_dps_vector)./sqrt(x_vector.^2+y_vector.^2)+...
    +cos(-psi_vector-fi_vector).*sqrt(x_vector.^2+y_vector.^2).*(-1-(dy_dps_vector.*x_vector-dx_dps_vector.*y_vector)./(x_vector.^2+y_vector.^2));

ddx_ddth=diff(dx_dth_vector)./diff(theta_vector);
ddxc1_ddth=diff(dxc1_dth)./diff(theta_vector);
ddyc1_ddth=diff(dyc1_dth)./diff(theta_vector);
thetas_ddc_ddth=theta_vector(1:end-1)+diff(theta_vector)/2;

ddy_ddth=diff(dy_dth_vector)./diff(theta_vector);
ddxc2_ddps=diff(dxc2_dps)./diff(psi_vector);
ddyc2_ddps=diff(dyc2_dps)./diff(psi_vector);
psis_ddc_ddth=psi_vector(1:end-1)+diff(psi_vector)/2;

footshape.theta=thetas_ddc_ddth;
footshape.psi=psis_ddc_ddth;
footshape.x=interp1(theta_vector,x_vector,thetas_ddc_ddth,'linear');
footshape.y=interp1(theta_vector,y_vector,thetas_ddc_ddth,'linear');
footshape.fi=interp1(theta_vector,fi_vector,thetas_ddc_ddth,'linear');

footshape.dx_dth=interp1(theta_vector,dx_dth_vector,thetas_ddc_ddth,'linear');
footshape.dy_dth=interp1(theta_vector,dy_dth_vector,thetas_ddc_ddth,'linear');
footshape.dx_dps=interp1(theta_vector,dx_dps_vector,thetas_ddc_ddth,'linear');
footshape.dy_dps=interp1(theta_vector,dy_dps_vector,thetas_ddc_ddth,'linear');

footshape.ddx_ddth=ddx_ddth;
footshape.ddy_ddth=ddy_ddth;

footshape.dc1x_dth=interp1(theta_vector,dxc1_dth,thetas_ddc_ddth,'linear');
footshape.dc1y_dth=interp1(theta_vector,dyc1_dth,thetas_ddc_ddth,'linear');
footshape.dc2x_dps=interp1(theta_vector,dxc2_dps,thetas_ddc_ddth,'linear');
footshape.dc2y_dps=interp1(theta_vector,dyc2_dps,thetas_ddc_ddth,'linear');


footshape.ddxc1_ddth=ddxc1_ddth;
footshape.ddyc1_ddth=ddyc1_ddth;
footshape.ddxc2_ddps=ddxc2_ddps;
footshape.ddyc2_ddps=ddyc2_ddps;

footshape.r=sqrt((footshape.x).^2+(footshape.y).^2);

footshape.curv=abs(((footshape.dx_dth.^2+footshape.dy_dth.^2).^(3/2))./(footshape.dx_dth.*footshape.ddy_ddth-footshape.ddx_ddth.*footshape.dy_dth));

save(name,'footshape')
end

