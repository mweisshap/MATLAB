clear all
clc 

A=[1 3; 4 2];
B=[5 7; 8 6];
C=[0 1; 1 0];

v=[1;2];

D=(A + B)*v
E=A*v + B*v
F=(A + B)*C
G=A*C + B*C 
H=C*A +C*B
I=A*A^-1
J=v'*v
K=v*v'
L=A*(B*C)
M=(A*B)*C
N=C*B*A
O=A'
P=(A*v)'
Q=v'*A'
R=v'*A'*A*v
S=sum(v)
T=[1 1]*v

