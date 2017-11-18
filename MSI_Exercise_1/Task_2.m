clc;
close all;
clear variables;

%Plotting the Data according to Task a)
delta_T = [5 15 35 60];
L = [6.55 9.63 17.24 9.64];
k = [1 2 3 4];

hold on
plot(k, L, 'x');
plot(k, delta_T,'x');

axis([0 5 0 70]);
xticks([1 2 3 4]);

title('Task 2 Plot');
legend('L [cm]', 'delta T [K]', 'Location', 'Northwest');
xlabel('k');
grid on

%Calculating the Estimates

%-L=


