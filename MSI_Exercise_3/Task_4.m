%%Problem with scaling of fit, polynomil does not fit the data. maybe units
%%wrong?

clear all;
close all;
clc;

load('exercise3_data.mat');
u(:,1)=data(:,1);
i(:,1)=data(:,2);



%Prepare the figure with labels
figure('Name', 'Plot of Data');
title('Plot of I_d over U');
xlabel('U [mV]');
ylabel('I_d [mA]');
axis([min(u)-50 max(u)+50 min(i)-200 max(i)+200]);
grid on;
hold on;



plot(u, i,'x')


%Plucking in the Constants:
m = 1.5; %Ideality factor [Unitless]
q = 1.6022e-19; %Elementary charge [C]
%k_b = 1.3806e-23; %Boltzmann constant [J/K]
k_b = physconst('Boltzmann');
T = 293; %Temperature [K]

%Script Parameters
N = 1000;%Number of measurements
n_p = 8;%Number of datapairs
d = 2;%Dimension of Fit

%Doing the LLS thing
PHI=ones(N*n_p,d);

%Fill in the values of the thing
for it=1:d
    C=(exp((q*u(:))/(m*k_b*T))-1);
    PHI(:,it)=u(1:(N*n_p)).^(it-1);
end

theta = pinv(PHI) * i(1:N*n_p);

x_p = 0:10:850;%mV
y_p = (theta(1) + theta(2) .* (exp((q*x_p./1000)/(m*k_b*T))-1))

hold on 
plot(x_p, y_p);
%{
% compute inverse
theta = (phi'* phi) \ phi' * I_d(1:N);

fit = theta(1) * (exp(q * U_k(1:N) / (m*k_B*T)) -1) + theta(2);
%}

