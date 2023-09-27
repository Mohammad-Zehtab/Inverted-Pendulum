clc; clear; close all;

te = 0:0.01:10;
X0 = [0; pi; 0; 0];

[t, X] = ode45(@sys,te,X0);

theta = X(:,2);
x = X(:,1);

figure
subplot(2,1,1)
plot(t,X(:,1),'linewidth',3)
set(gca,'fontsize',10,'fontweight','bold');
xlabel('Time(s)','fontsize',10,'fontweight','bold');
ylabel('x(t)','fontsize',10,'fontweight','bold');

subplot(2,1,2)
plot(t,X(:,2),'linewidth',3)
set(gca,'fontsize',10,'fontweight','bold');
xlabel('Time(s)','fontsize',10,'fontweight','bold');
ylabel('\theta(t)','fontsize',10,'fontweight','bold');
