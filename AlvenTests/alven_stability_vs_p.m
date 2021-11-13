%% Check error after one alven wave cycle versus initial gas pressure

clear;close all;
% Load data
p=[1e-4 3e-4 1e-3 3e-3 1e-2 3e-2 1e-1 3e-1 1e0 3e0 1e1 3e1 1e2 1e3 1e4 1e5];
nx=length(get_vy('_1e-03'));
vy=zeros(nx,length(p));
for i=1:length(p)
    p_string=sprintf('_%1.0e',p(i));
    vy(:,i)=get_vy(p_string);
end

% Prepare exact solution
vy_exact=0.1*sin(2*pi*(1:nx)/nx)';

% Plot for sanity check
figure
plot(vy_exact,'o')
leg=cell(size(p));
leg{1}='exact';
hold on
for i=1:length(p)
    plot(vy(:,i))
    leg{i+1}=sprintf('p=%1.0e',p(i));
end
hold off
xlabel('x')
ylabel('v_y')
title('Phase space after one period')
legend(leg)


% Calculate errors
err=zeros(size(p));
for i=1:length(p)
    err(i)=1/nx*sum((vy(:,i)-vy_exact).^2);
end

% Plot results
figure
loglog(p,err,'.-')
ylabel('Error')
xlabel('p, Gas pressure')
title('Error versus initial gas pressure after one period')