clc
close all
clear variables 

N_max = 1000;
Studenten = 200;
load('exercise1_dataset.mat')
%Task 3 Excercise a)

R_single=[zeros(1,N_max); zeros(1,N_max); zeros(1,N_max)];

for it=1:N_max
    
    R_single(1, it) = SimpleAverage( v_k((1:it), 1), i_k((1:it) , 1));
    R_single(2, it) = LeastSquares( v_k((1:it), 1), i_k((1:it) , 1));
    R_single(3, it) = ErrorInVariables( v_k((1:it), 1), i_k((1:it) , 1));
    
end
%Calculations done, Plotting next

fig = 1;
figure('Name', 'Task a) Comparison of estimators');
title('Different Approximations over One Dataset (1000 Datapoints)');
xlabel('k');
ylabel('R [Ohm]');
grid on;
hold on;
plot((1:N_max), R_single(1,:))
plot((1:N_max), R_single(2,:))
plot((1:N_max), R_single(3,:))
legend('R_S_A', 'R_L_S','R_E_V', 'Location', 'Northwest');
hold off;
%Task 3 Excercise b)

R_complete_SA=[zeros(Studenten , N_max)];
R_complete_LS=[zeros(Studenten , N_max)];
R_complete_EV=[zeros(Studenten , N_max)];

for ot=1:Studenten
    for it=1:N_max
        R_complete_SA(ot, it) = SimpleAverage( v_k((1:it), ot), i_k((1:it) , ot));
        R_complete_LS(ot, it) = LeastSquares( v_k((1:it), ot), i_k((1:it) , ot));
        R_complete_EV(ot, it) = ErrorInVariables( v_k((1:it), ot), i_k((1:it) , ot));
    end
end




% 
% for o_it=1:1000
%     for i_it=1:200
%        %R_complete(o_it, i_it) = SimpleAverage(v_k( (1:o_it) , (1:i_it) ) , i_k( (1:o_it) , (1:i_it) ));
%        % R_complete(1000+o_it, i_it) = LeastSquares(v_k( (1:o_it) , (1:i_it) ) , i_k( (1:o_it) , (1:i_it) ));
%         %R_complete(2000+o_it, i_it) = ErrorInVariables(v_k( (1:o_it) , (1:i_it) ) , i_k( (1:o_it) , (1:i_it) ));
%     end  
% end
% 
fig = 2;%Plot for all the SimpleAverage Values
figure('Name', 'Different Estimators used on all 200 datasets of 1000 samples');


hold on;

subplot(3,1,1);
plot(1:1000, R_complete_SA);
title('Simple average used on 200 datasets');
xlabel('k');
ylabel('R [Ohm]');
grid on;


subplot(3,1,2);
plot(1:1000, R_complete_LS);
title('Least squares used on 200 datasets');
xlabel('k');
ylabel('R [Ohm]');
grid on;

subplot(3,1,3);
plot(1:1000, R_complete_EV);
title('Error in Values used on 200 datasets');
xlabel('k');
ylabel('R [Ohm]');
grid on;

%Task 3 Excercise c)
R_Data=[zeros(1,200); zeros(1,200); zeros(1,200)];
 
for i=1:Studenten
     
     R_Data(1, i)=(sum(R_complete_SA(i, 1000)/i));
     R_Data(2, i)=(sum(R_complete_LS(i, 1000)/i));
     R_Data(3, i)=(sum(R_complete_EV(i, 1000)/i));
end

figure('Name', 'Convergence of all final values, over all datasets');
hold on;
grid on;
plot(1:Studenten, R_Data(1, :));
plot(1:Studenten, R_Data(2, :));
plot(1:Studenten, R_Data(3, :));
legend('R_S_A', 'R_L_S', 'R_E_V', 'Location', 'Northwest');






% fig = 3;%Plot for all the LeastSquare Values
% figure(fig);
% 
% fig = 4;%Plot for all the ErrorInVariable Values
% figure(fig);
