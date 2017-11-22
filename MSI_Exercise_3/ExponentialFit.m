function [theta,PHI,sigma, cov] = ExponentialFit(u, i, N, d)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%Plucking in the Constants:
m = 1.5; %Ideality factor [Unitless]
q = 1.6022e-19; %Elementary charge [C]
%k_b = 1.3806e-23; %Boltzmann constant [J/K]
k_b = physconst('Boltzmann');%Boltzmann constant [J/K]
T = 293; %Temperature [K]

%Doing the LLS thing
PHI_t=ones(N,d);


%Fill in the values of the thing
C = (exp((q*u(1:N))/(m*k_b*T))-1);

for it=1:d
   
    %PHI(:,it)=u(1:(N*n_p)).^(it-1);
    PHI_t(:, it) = C.^(it-1);
end

PHI=fliplr(PHI_t);

theta = pinv(PHI) * i(1:N);

sigma = 1/(N-d) * norm((i(1:N)-PHI*theta),2);

cov = sigma*inv((PHI'*PHI));


end

