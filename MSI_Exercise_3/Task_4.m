%%Problem with scaling of fit, polynomil does not fit the data. maybe units
%%wrong?

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

%Script Parameters
N = 1000;%Number of measurements
n_p = 8;%Number of datapairs
d = 2;%Dimension of Fit

%Doing the LLS thing
PHI=ones(N*n_p,d);


%Fill in the values of the thing
C = (exp((q*u(:))/(m*k_b*T))-1);

for it=1:d
   
    %PHI(:,it)=u(1:(N*n_p)).^(it-1);
    PHI(:, it) = C.^(it-1);
end

PHI=fliplr(PHI);

theta = pinv(PHI) * i(1:N*n_p);

%theta_2 = (inv(PHI'*PHI)*PHI') * i(1:N*n_p)

x_p = 0:0.01:0.85;%V

%y_p = (theta(1) + theta(2) * (exp((q*x_p)/(m*k_b*T))-1));

y_p = (theta(2) + theta(1) * (exp((q*u)/(m*k_b*T))-1));


hold on 
plot(sort(u), sort(y_p));

legend('Data', 'Fit', 'Location', 'Northwest');

error = i()-y_p();
v_err = var(error);


%c1 = cov(theta)
c2 = v_err*inv(PHI'*PHI)
c3 = (PHI'*PHI)/v_err


