clear;close all;
% Load data
u=load('u.dat');
t=load('t.dat');
b=load('b.dat');

% Unpack data
nt=length(t);
nx=length(u)/nt;
rho=zeros(nx,nt);
vx=rho;
vy=rho;
vz=rho;
e=rho;
bx=rho;
by=rho;
bz=rho;
for i=1:nt
    rho(:,i)=u((1:nx)+(i-1)*nx,1);
    vx(:,i)=u((1:nx)+(i-1)*nx,2);
    vy(:,i)=u((1:nx)+(i-1)*nx,3);
    vz(:,i)=u((1:nx)+(i-1)*nx,4);
    e(:,i)=u((1:nx)+(i-1)*nx,5);
    bx(:,i)=b((1:nx)+(i-1)*nx,1);
    by(:,i)=b((1:nx)+(i-1)*nx,2);
    bz(:,i)=b((1:nx)+(i-1)*nx,3);
end

figure
skip=1;
for i=1:skip:nt
    TITLE=sprintf('t = %1.2e',t(i));
    sgtitle(TITLE)

    % vx
    subplot(2,3,1)
    plot(vx(:,i))
    ylabel('vx')
    ylim([-11 11])
    % vy
    subplot(2,3,2)
    plot(vy(:,i))
    ylabel('vy')
    ylim([-0.5 0.5])
    % vz
    subplot(2,3,3)
    plot(vz(:,i))
    ylabel('vz')
    ylim([-1 1])
    % bx
    subplot(2,3,4)
    plot(bx(:,i))
    ylabel('bx')
    ylim([1.3 1.5])
    % by
    subplot(2,3,5)
    plot(by(:,i))
    ylabel('by')
    ylim([1 6])
    % bz
    subplot(2,3,6)
    plot(bz(:,i))
    ylabel('bz')
    ylim([-1 1])

    pause(0.1)
end