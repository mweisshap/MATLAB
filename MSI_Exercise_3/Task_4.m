clear all;
close all;
clc;

load('exercise3_data.mat');
u(:,1)=data(:,1);
i(:,1)=data(:,2);


%Plucking in the Constants:
m = 1.5; %Ideality factor [Unitless]
q = 1.6022e-19; %Elementary charge [C]
k_b = 1.3806e-23; %Boltzmann constant [J/K]
T = 293; %Temperature [K]




