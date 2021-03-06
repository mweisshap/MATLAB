
clear all;
close all;
clc;

load('exercise3_data.mat');

scaling = 1000;
u(:,1)=data(:,1)./scaling;
i(:,1)=data(:,2)./scaling;


%Prepare the figure with labels
figure('Name', 'Plot of Data');
title('Plot of I_d over U');
xlabel('U [V]');
ylabel('I_d [A]');
xpadding = 0.05;
ypadding = 0.2;
axis([min(u)-xpadding max(u)+xpadding min(i)-ypadding max(i)+ypadding]);
grid on;
hold on;



plot(u, i,'x')


%Plucking in the Constants:
m = 1.5; %Ideality factor [Unitless]
q = 1.6022e-19; %Elementary charge [C]
%k_b = 1.3806e-23; %Boltzmann constant [J/K]
k_b = physconst('Boltzmann');%Boltzmann constant [J/K]
T = 293; %Temperature [K]


%Calculate the fit for 1000 meassurements
[theta_8k, PHI_8k, var_e_8k, cov_8k] = ExponentialFit(u(),i(),8000,2);

%Calculate the fit for 500 experiments
[theta_4k, PHI_4k, var_e_4k, cov_4k] = ExponentialFit(u(),i(),4000,2);



%Plot the fit into the data
y_p = (theta_8k(2) + theta_8k(1) * (exp((q*u(:))/(m*k_b*T))-1));

hold on 
plot(sort(u), sort(y_p));
legend('Data', 'Fit', 'Location', 'Northwest');



