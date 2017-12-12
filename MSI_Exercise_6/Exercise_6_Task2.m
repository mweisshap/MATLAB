%Computer Exercise from Sheet 6 of the Modelling and System Identification
%Course.

clear all;
close all;
clc;

%M=importdata("produktffstunde195501012016123101346.txt", 

T=readtable("produkt_ff_stunde_19550101_20161231_01346.txt");

D=T(401233:(401233+8480),:);

Data=D(:,4:5);

F=Data.F;%Wind Speed in m/s


data_check=sort(F);
data_corrected=data_check(4:end);
min(D.F);

%Make a nice plot
figure('Name', 'Wind distribution');
title('Histogram of wind distribution');
ylabel('Occurrences');
xlabel('wind speed [m/s]');
grid on;
hold on;



%histogram(data_check)
h=histogram(data_corrected,'BinWidth',1);
%x(2) = lambda
%x(1) = k
N=numel(data_corrected);

%Original objective function to minimize
obj_fun=@(in)(-N*log(in(1))+N*in(1)*log(in(2))+1/((in(2)).^in(1))*sum(data_corrected.^in(1))-(in(1)-1)*sum(log(data_corrected)));
x=fmincon(obj_fun, [1 1],[],[],[],[],[0 0],[])


%Reduced objective function to minimize
obj_fun_2=@(in)1/((in(2)).^in(1))*sum(data_corrected.^in(1))-(in(1)-1)*sum(log(data_corrected));

x_2=fmincon(obj_fun, [1 1],[],[],[],[],[0 0],[])



d_f=makedist('Weibull','a',x(2),'b',x(1));
y_prb=pdf(d_f,h.BinEdges);

%Power Curve
pwr=[0 0 3 25 82 174 321 532 815 1180 1580 1900 2200 2480 2700 2850 2950 3020 3020 3020 3020 3020 3020 3020 3020 3020 0 0 0 0];
%Computation of the powerdistribution
powerdist = y_prb .* pwr;

%Calculation of Expectation value for output power
Exp_Power=trapz(powerdist)

y_f=N*pdf(d_f,h.BinEdges);
hold on;
plot(h.BinEdges,y_f,'-x','LineWidth', 1.25)

