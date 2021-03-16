% By Mohammad Zandsalimy
% mohammad.zandsalimy@ubc.ca

clc;clear all;close all;

p_a=[1;
  0.95;
  0.891326857516377;
  0.8;
  0.7;
  0.602092921099992;
  0.4;
  0.147904383222765;
  0.05];

% p_a=[1;
%   0.891326857516377;
%   0.602092921099992;
%   0.147904383222765];

% p_a=1.0;

p_0=1;
k=1.4;

N=1001;
x=linspace(0.0,3.0,N)';
p=zeros(length(p_a),N+2);
M=zeros(length(p_a),N+2);
% r=1.0+1.0*(1.0+cos(x*pi/1.0));
% r(floor(N/2):end)=0.1*(r(floor(N/2):end)-1.0)+1.0;
A=area(x);
x(N+1:N+2)=[3.1;3.3];

sol=solveAeraForMach(A(end)/1.0,0,1);
p_ratio(1)=(1+(k-1)*sol^2/2)^(-k/(k-1));
sol=solveAeraForMach(A(end)/1.0,1,1000);
p_ratio(3)=(1+(k-1)*sol^2/2)^(-k/(k-1));
p_ratio(2)=p_ratio(3)*(2*k*sol^2-k+1)/(k+1);

for i=1:length(p_a)
  if (p_a(i)>p_ratio(1))
    sol=solvePressureForMach(p_a(i),0,1);
    A_star=A(end)/solveMachForArea(sol);
    for j=1:N
      M(i,j)=solveAeraForMach(A(j)/A_star,0,1);
      p(i,j)=solveMachForPressure(M(i,j));
    end
    p(i,N+1:end)=p(i,N);
    M(i,N+1:end)=M(i,N);
  elseif (p_a(i)>p_ratio(2))
    A_star=1.0;
    for j=1:floor(N*2/3)
      M(i,j)=solveAeraForMach(A(j)/A_star,0,1);
      p(i,j)=solveMachForPressure(M(i,j));
    end
    [sol,A_star_new,p0_new]=solveForShockPosition(p_a(i),2,3);
    for j=floor(N*2/3)+1:sum(x<sol)
      M(i,j)=solveAeraForMach(A(j)/A_star,1,1000);
      p(i,j)=solveMachForPressure(M(i,j));
    end
    for j=sum(x<sol)+1:N
      M(i,j)=solveAeraForMach(A(j)/A_star_new,0,1);
      p(i,j)=p0_new*solveMachForPressure(M(i,j));
    end
    p(i,N+1:end)=p(i,N);
    M(i,N+1:end)=M(i,N);
  else
    A_star=1.0;
    for j=1:floor(N*2/3)
      M(i,j)=solveAeraForMach(A(j)/A_star,0,1);
      p(i,j)=solveMachForPressure(M(i,j));
    end
    for j=floor(N*2/3)+1:N
      sol=solveAeraForMach(A(j)/A_star,1,1000);
      M(i,j)=sol;
      p(i,j)=solveMachForPressure(sol);
    end
    p(i,N+1:N+2)=p_a(i);
    M(i,N+1:end)=solvePressureForMach(p_a(i),1,1000);
  end
end

% fig = figure('position', [50, 50, 1000, 900]);

subplot(3,1,2);
hold on
plot(x,p,'LineWidth',2)
plot([2,2,3,3,2],[-1,2,2,-1,-1],'--k')
for i=1:length(p_a)
  text(x(end)+0.1,p(i,end),num2str(p(i,end)));
end
axis([0,4,0,1.2])
xlabel('x');
ylabel('p/p_0');

subplot(3,1,3);
hold on
plot(x,M,'LineWidth',2)
plot([2,2,3,3,2],[-1,10,10,-1,-1],'--k')
for i=1:length(p_a)
  text(x(end)+0.1,M(i,end),num2str(M(i,end)));
end
axis([0,4,-0.2,3])
xlabel('x');
ylabel('M');

x(N+1:N+2)=[];
subplot(3,1,1);
hold on
fill([0,0,3,3,0],[-2,2,2,-2,-2],'k','FaceAlpha',.3,'EdgeAlpha',.3)
fill([x;flipud(x)],0.5*[A;-flipud(A)],'w','EdgeColor','w')
plot([2,2,3,3,2],[-10,10,10,-10,-10],'--k')
axis([0,4,-2,2])
xlabel('x');
ylabel('Area');
