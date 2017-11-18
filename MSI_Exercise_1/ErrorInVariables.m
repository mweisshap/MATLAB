function [result] = ErrorInVariables(in1,in2)

num_a = length(in1);
num_b = length(in2);

%Check if the Input vectors have the same length.
%If not, return without a value
result = NaN;

if num_a ~= num_b
    return
end

clear num_b; %Discard one length value since it is no longer needed


%Prepare Accumulation Variables
temp_numerator = 0;
temp_denomin = 0;


%Calculate the Sums
for it = 1:num_a
    
    temp_numerator = temp_numerator + in1(it);
    temp_denomin = temp_denomin + in2(it);

end

%Scale Accumulations with Number of Elements computed
temp_numerator = (temp_numerator/num_a);
temp_denomin = (temp_denomin/num_a);

result = (temp_numerator/temp_denomin);
end

