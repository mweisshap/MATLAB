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

histogram(data_check)
%histogram(data_corrected)
