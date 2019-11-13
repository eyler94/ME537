% hw5p1a

clc
clear
close all

A = randi(10,3);
correct = expm(A)
k=0;
guess = mat_e(A,k)
diff = correct-guess
while(diff~=zeros(size(A)))
    k=k+1
    correct
    guess = mat_e(A,k)
    diff_1 = diff
    diff = correct-guess
    diff_diff = diff_1-diff
    if k>170||isequal(diff_diff,zeros(size(A)))
        break
    end
end

% For the given matrix, they match to 4 decimal places at k=31, and at k=52 the guess stops
% changing.
% A =
% 
%      3     4     2
%     10     1     1
%      3     7     8