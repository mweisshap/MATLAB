%% initial look on the data
close all; clear;

% load measurements
load('track.mat');

% plot measurements
figure; hold on; grid on;
plot3(positions(1,:), positions(2,:), positions(3,:),...
    positions(1,1), positions(2,1), positions(3,1), 'r+');

%% Derivatives
% velocities
steps = diff(positions, 1 ,2); % [d/dx; d/dy; d/dz]
timeSteps = diff(timeStamps(1, : )); % [dt/dx]=[dt/dy]=[dt/dz] 5second timesteps
xVelocity = steps(1, :) ./timeSteps% velocity in x-direction
yVelocity = steps(2, :) ./timeSteps% velocity in y-direction
zVelocity = steps(3, :) ./timeSteps % velocity in z-direction

%% Norms
speed = sqrt(xVelocity.^2 + yVelocity.^2 + zVelocity.^2);
% plot speed
figure; hold on; grid on;
plot(1:800, speed,'b-');
ylabel('m/s'); xlabel('s');
legend('Speed');

% (Optional) length of bike trip

wheel_r = 27.5; %[cm]

ammt_rotations = 5342;

wheel_circ = 2 * PI * wheel_r;

%l_trip_

N = 5342;

%% Rank

% (18)
A = [2*pi*N -2*pi*N; 0 1];
b = [2000; 0.275];

% check if A has full rank
rank(A)

x = A^-1*b; % calculate x

r_actual = x(1);% select actual radius from x

%% Eigenvalues and Eigenvectors

A = [1.25 -0.75; -0.75 1.25]; % transformation matix

[V, D] = ; %calculate eigenvalues and eigenvectors
eigenVectors = ...; % scale eigenvectors with eigenvalues

% references: unit circle & unit square
unitCircle = [cos(linspace(0,2*pi,50)); sin(linspace(0,2*pi,50))]; 
unitSquare = [1 1 -1 -1 1;1 -1 -1  1 1];

ellipse = A * unitCircle;
parallelogram = A * unitSquare;

mm = 2.5; % axis limit
figure; hold on; grid on; axis([-mm mm -mm mm]); axis equal;
plot(...,...); % plot unitSquare
plot(...,...); % plot parallelogram
quiver(0,0,eigenVectors(1,1),eigenVectors(2,1),0);
quiver(0,0,eigenVectors(1,2),eigenVectors(2,2),0);
xlabel('x'); ylabel('y');
legend('unit square', 'image of unit square','first eigenvector', 'second eigenvector');

figure; hold on; grid on; axis([-mm mm -mm mm]); axis equal;
plot(...,...); % plot unitCircle
plot(...,...); % plot ellipse
quiver(0,0,eigenVectors(1,1),eigenVectors(2,1),0);
quiver(0,0,eigenVectors(1,2),eigenVectors(2,2),0);
xlabel('x'); ylabel('y');
legend('unit square', 'image of unit square','first eigenvector', 'second eigenvector');


%% Matrix exponential (not asked)
% just an example so you have seen it
expm(eye(3))

%% Symmetric Matrices (optional)
% this can be done by hand! If you want to verify your solution go ahead.
% Hint: use 'syms' to define your sybolic variables

%% Positive / Negative (Semi-) Deinite
% this can be done by hand! If you want to verify your solution go ahead.
% Hint: to check that all eigen values are greater or equal than 0 use
%       all(eigenValuesOfYourMatrix >= 0)

%% Orthogonal matrices
% this can be done by hand! If you want to verify your solution go ahead.
% Hint: with 'isequal(A,B)' you can check if two matrices are equal.
%       You might run into trouble, since the computation accuracy is
%       limited and might need to check it against a threshold
%       all(all(matrixThatShouldBeZero <= eps))
%       'eps' is the machine precision

%% Upper / Lower Triangular Matrices
% this can be done by hand! If you want to verify your solution go ahead.

%% Diagonal matrices
% this can be done by hand! If you want to verify your solution go ahead.

%% Linear and Affine Functions
% this can be done by hand! If you want to verify your solution go ahead.

%% Quadratic Functions
% this can be done by hand! If you want to verify your solution go ahead.
