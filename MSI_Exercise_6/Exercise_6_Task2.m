%Computer Exercise from Sheet 6 of the Modelling and System Identification
%Course.

clear all;
close all;
clc;

%M=importdata("produktffstunde195501012016123101346.txt", 

T=readtable("produkt_ff_stunde_19550101_20161231_01346.txt");

D=T(401233:(401233+8480),:);

Data=D(:,4:5);

F=Data.F%Wind Speed in m/s


data_check=sort(F);
data_corrected=data_check(4:end)
min(D.F)

%histogram(data_check)
h=histogram(data_corrected,'BinWidth',1)
%x(2) = lambda
%x(1) = k
N=numel(data_corrected);
obj_fun=@(in)(-N*log(in(1))+N*in(1)*log(in(2))+1/((in(2)).^in(1))*sum(data_corrected.^in(1))-(in(1)-1)*sum(log(data_corrected)));

x=fmincon(obj_fun, [1 1],[],[],[],[],[0 0],[])

obj_fun_2=@(in)1/((in(2)).^in(1))*sum(data_corrected.^in(1))-(in(1)-1)*sum(log(data_corrected));

x_2=fmincon(obj_fun, [1 1],[],[],[],[],[0 0],[])



d_f=makedist('Weibull','a',x(2),'b',x(1));
y_f=N*pdf(d_f,h.BinEdges);
hold on;
plot(h.BinEdges,y_f,'-x')


%p_y=N*(x(1)/x(2))*(x_f/x(2)).^(x(1)-1).*exp(-((x_f/x(2)).^x(1)))
