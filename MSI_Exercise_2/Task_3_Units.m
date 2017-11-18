% Modelling and System Identification Excercise 3
%
%   Juliane Weilbach, M.Nr.
%   Marius Weisshap,  M.Nr.
%

close all;
clear all;
clc;
tic;

% Task 3
% Section a)

%Load the data from the supplied file, Data.mat
load('exercise2_data.mat');
num_data = 16000/8;
size_data_set = 8;
u=zeros(size_data_set, num_data);
i=zeros(size_data_set, num_data);

%Extract the Data to vectors
u(:)=data(:,1);
i(:)=data(:,2);

%Prepare the figure with labels
figure('Name', 'Plot of Data');
title('Plot of I_d over U');
xlabel('U [mV]');
ylabel('I_d [mA]');
axis([50 850 -150 1600]);
grid on;
hold on;

%Plot all the data into one Plot
for it=1:num_data
plot(u((1:8), it), i((1:8), it), 'x');
end

%Section c)
figure('Name', 'Data with Polynomials of different orders');
title('Polynomials with Data');
xlabel('U [mV]');
ylabel('I_d [mA]');
axis([50 850 -150 1600]);
grid on;
hold on;
plot_data = plot(data(1:16000,1),data(1:16000,2), '+');
plot_data.Annotation.LegendInformation.IconDisplayStyle = 'off';

high_polyn = 3;
to_plot = [2 3];

for it_o=1:high_polyn-1
    %Input data length/Length of the input vectors to be used in LS
    %Approximation
    N = 16;
    %Order of Polynomial to fit:
    d = it_o + 1;
    %Number of Coefficients in Polynomial/Theta
    num_coeff = d + 1;


    %Dependant variable
    %Transposing in order to receive columnvector
    %Names chosen for consistency with the script
    y=i(1:N)';
    
    %Preallocate memory for the Regression matrix
    PHI=ones(N,num_coeff);

    %Fill in the matrix data, directly compute the powers
    for it=1:num_coeff
        PHI(:,it)=u(1:N).^(it-1);    
    end

    %Compute the Pseudo inverse of the data
    pinv_PHI=pinv(PHI);

    %Compute the coefficients from LS norm by calculating the minimizer of 
    %the objective function Section d)
    %
    %   Invertible because Matrix has full rank
% 
%     PHI_temp = PHI;
%     
%     A=PHI_temp'*PHI_temp;
%     
%     D=det(A)
%     
%     B=diff(A)
%     
%     C=diff(B)
%     
    %
    %
    %----------------------------------------------------------------------
    %theta=pinv_PHI*y %No warning

    %theta = inv(PHI'*PHI) * PHI' * y %Warning, 'slow'
    
    theta = (PHI'*PHI) \ PHI' * y %Warning, 'fast'
    %----------------------------------------------------------------------
    
    %Flip theta to make the coefficient vector match the format expected by
    %MATLAB for a polynomial, with coefficients in descending order
    coeffs=flipud(theta);

    %Display the data nicely

    %Put in the Polynomials
    x_p = 0:10:900;
    y_p = polyval(coeffs, x_p);
    if(ismember(d, to_plot))
        plot(x_p, y_p, '-', 'DisplayName', ['Order: '  num2str(d)]);
    end
end
legend('show', 'Location', 'Northwest');
    
toc