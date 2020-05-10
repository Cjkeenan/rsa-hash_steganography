% Python Code
% def euclidAlgo(larger, smaller):
%     if(smaller > larger):
%         temp = larger
%         larger = smaller
%         smaller = temp
%     
%     rem = larger % smaller
% 
%     if(rem == 0):
%         return smaller
%     
%     return euclidAlgo(smaller, rem)

function [gcd] = euclidAlgo(largerNum,smallerNum)
%EUCLIDALGO Summary of this function goes here
%   Detailed explanation goes here
    if(smallerNum > largerNum)
        temp = largerNum;
        largerNum = smallerNum;
        smallerNum = temp;
    end

    remainder = mod(largerNum,smallerNum);

    if(remainder == 0)
        gcd = smallerNum;
    else
        gcd = euclidAlgo(smallerNum,remainder);
    end
end

