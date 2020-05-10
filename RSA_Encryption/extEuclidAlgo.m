% Python Code
% def extEuclidAlgo(a, b):
%     a, b = abs(a), abs(b)
%     x0, x1, y0, y1 = 1, 0, 0, 1
%     while b != 0:
%         q, a, b = a // b, b, a % b
%         x0, x1 = x1, x0 - q * x1
%         y0, y1 = y1, y0 - q * y1
%     return a, x0, y0

function [gcd,s,t] = extEuclidAlgo(a,b)
%EXTEUCLIDALGO Summary of this function goes here
%   Detailed explanation goes here
    a = abs(a);
    b = abs(b);
    
    x = 0;
    y = 1;
    u = 1;
    v = 0;
    
    while(a ~= 0)
        q = floor(b/a);
        r = mod(b,a);
        
        m = x - u * q;
        n = y - v * q;
        
        b = a;
        a = r;
        x = u;
        y = v;
        u = m;
        v = n;
    end
    
    gcd = b;
    s = x;
    t = y;
end

