% Python Code
% def eulerPhi(n):
%     factors = primeFactors(n)
%     phi = n
%     for i in range (0, len(factors)):
%         temp = 1 - (1/factors[i])
%         phi *= temp
%     return int(phi)

function [phi] = eulerPhi(number)
%EULERPHI: This function implements Euler's Phi (Totient) function in order
%to find the counter of numbers up to the given number that are relatively
%prime to that given number
%   Input: Any number
%   Output: Count of how many numbers are relatively prime to the given
%   number
    [p,e] = primeFactors(number);
    phi = 1;
    for i = 2:size(p,2)
        temp = (p(i)^e(i)) - (p(i)^(e(i)-1));
        phi = phi * temp;
    end
end