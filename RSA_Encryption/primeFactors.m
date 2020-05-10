% Python Code
% def primeFactors(number):
%     factors = []
%     for i in range(2, number + 1):
%         if(number % i == 0):
%             prime = True
%             for j in range(2, (i//2 + 1)):
%                 if(i % j == 0):
%                     prime = False
%                     break               
%             if (prime):
%                 factors.append(i)
%     return factors

function [p,e] = primeFactors(number)
%PRIME_FACTORS: This function finds all prime factors of a given number
%   Input: Any number
%   Output: Prime factor base, Prime factor exponent
% Loops to test all integers (2 through number) as PFs
    p = 1;
    e = 1;
    for i = 2:number
        s = 0;
        % Is number/i an integer? Is the remainder 0?
        while(number/i == floor(number/i))
            number = number/i;
            s = s + 1;
        end

        % A PF is found and displayed
        if(s > 0)
            p(end+1) = i;
            e(end+1) = s;

            % If number = 1, no more divisions are necessary, 
            % thus breaks the loop and quits
            if(number == 1)
                break
            end
        end
    end
end

