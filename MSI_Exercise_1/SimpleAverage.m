function [result] = SimpleAverage(in1,in2)


num_a = length(in1);
num_b = length(in2);

%Check if the Input vectors have the same length.
%If not, return without a value
result = NaN;
if num_a ~= num_b
    return
end

clear num_b; %Discard one length value since it is no longer needed


temp_result = 0;
%Calculatie the Sum
for it=1:num_a
    %Calculation of the Resistance
    temp_result = temp_result + (in1(it)/in2(it));
end

%Scale Accumulations with Number of Elements computed
result = (temp_result/num_a);

end

