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
%EUCLIDALGO: This function implements the standard Euclidean Algorithm to
%find the GCD of two numbers recursively
%   Input: Any two numbers
%   Output: GCD of the two numbers
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

