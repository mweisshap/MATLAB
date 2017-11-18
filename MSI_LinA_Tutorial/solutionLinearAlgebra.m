close all; clear;

%% initial look on the data
% load measurements
load('track.mat');

% plot measurements
figure; hold on; grid on;
plot3(positions(1,:), positions(2,:), positions(3,:),...
    positions(1,1), positions(2,1), positions(3,1), 'r+');

%% Derivatives
% velocity
steps = diff(positions,1,2); % [d/dx; d/dy; d/dz]
timeSteps = diff(timeStamps); % [dt/dx]=[dt/dy]=[dt/dz]
xVelocity = steps(1,:) ./ timeSteps; % velocities in x-direction
yVelocity = steps(2,:) ./ timeSteps; % velocities in y-direction
zVelocity = steps(3,:) ./ timeSteps; % velocities in z-direction

%% Norms
speed = sqrt(xVelocity.^2 + yVelocity.^2 + zVelocity.^2); % euclidean norm

% plot speed
figure; hold on; grid on;
plot(timeStamps(1:end-1), speed,'b-');
ylabel('m/s'); xlabel('s');
legend('Speed');

% (Optional) length of bike trip

absSteps = sqrt(sum(steps.^2,1));
length = sum(absSteps)
avgSpeed = length/(timeStamps(end)-timeStamps(1))
avgSpeed_kmh = avgSpeed * 3.6

%% Rank

% m18
A = [2*pi*5342 -2*pi*5342; 0 1]
b = [2000; 0.275]

m19 = rank([3 4 1; 5 7 9; 6 8 2])

m20 = rank([8 1 6; 3 5 7; 4 9 2])

m21 = rank(A)
if m21 == size(A,2)
    disp('A has full rank, thus unique solution exists:');
    x = inv(A)*b;
end

r_actual = x(1) %m22

%% Eigenvalues and Eigenvectors

A = [1.25 -0.75; -0.75 1.25]; % transformation matix
%A = magic(2); % (optional) user defined matrix

[V, D] = eig(A); %calculate eigenvalues and eigenvectors
eigenVectors = V * D; % scale eigenvectors with eigenvalues

% references: unit circle & unit square
unitCircle = [cos(linspace(0,2*pi,50)); sin(linspace(0,2*pi,50))]; 
unitSquare = [1 1 -1 -1 1;1 -1 -1  1 1];

ellipse = A * unitCircle;
parallelogram = A * unitSquare;

mm = 2.5; % axis limit
figure; hold on; grid on; axis([-mm mm -mm mm]); axis equal;
plot(unitSquare(1,:),unitSquare(2,:));
plot(parallelogram(1,:),parallelogram(2,:));
quiver(0,0,eigenVectors(1,1),eigenVectors(2,1),0);
quiver(0,0,eigenVectors(1,2),eigenVectors(2,2),0);
xlabel('x'); ylabel('y');
legend('unit square', 'image of unit square','first eigenvector', 'second eigenvector');

figure; hold on; grid on; axis([-mm mm -mm mm]); axis equal;
plot(unitCircle(1,:),unitCircle(2,:));
plot(ellipse(1,:),ellipse(2,:));
quiver(0,0,eigenVectors(1,1),eigenVectors(2,1),0);
quiver(0,0,eigenVectors(1,2),eigenVectors(2,2),0);
xlabel('x'); ylabel('y');
legend('unit square', 'image of unit square','first eigenvector', 'second eigenvector');


%% Matrix exponential (not asked)

expm(eye(3))

%% Symmetric Matrices (optional)

% m23 not matlab solvalbe
syms a b c d v w;
m24 = [v;w] * [v w]
m25 = [v w] * [a b; c d] * [v; w]

%% Positive / Negative (Semi-) Deinite
M1 = [1 3; 4 2];

m26 = all(eig(M1)>=0)

m27 = all(eig(M1*M1.') >= 0)

M2 = [8 1 6; 3 5 7];

m28 = false % all(eig(M2) >= 0) returns error since M2 is not square

m29 = all(eig(M2.'*M2) >= 0)

m30 = all(eig(M2*M2.') >= 0)

m31 = all(eig([2 -1 0; -1 2 -1; 0 -1 2]) >= 0)

m32 = all(eig(eye(3)) >= 0)

%% Orthogonal matrices

M33 = [2 0; 0 0.5];
m33 = isequal(M33*M33.', eye(size(M33)))

M34 = ones(2) - eye(2);
m34 = isequal(M34*M34.', eye(size(M34)))

M35 = 1/3 * [2 -2 1; 1 2 2; 2 1 -2];
% isequal returns false due to computation erros
m35 = all(all(M35*M35.' - eye(size(M35)) <= eps))

%% Upper / Lower Triangular Matrices
M36 = [ 1 99 5; 0 3 6; 0 0 1];
m36 = det(M36) % all of diagonal entries have no influence

syms e f;
m37 = det([a 0 0; b c 0; d e f])

m38 = inv(M36) * [120; 13; 2]

%% Diagonal matrices

%m39 not solvable with matlab (all gaps are 0)

m40 = diag([1 4 7]) + diag([4 -1 5])

m41 = diag([1 4 7]) * diag([4 -1 5])

m42 = inv(diag([1 4 7]))

%% Linear and Affine Functions

A43 = [5 7]
b43 = 9
% x = [x1; x2]

A44 = [A43 0; 24 0 23]
b44 = [9; -42]
% x = [x1; x2; x3]

A45 = [A43; 0 1; 25 -49]
b45 = [9; 0.5; 81]
% x = [x1; x2]

%% Quadratic Functions

% x = [x1; x2]
A46 = [7 2; 2 2] %e.g. [7 4; 0 2] would work as well
B46 = zeros(2)
c46 = [0; 0];

% x = [x1; x2]
A47 = A46
B46 = A43
c46 = b43



