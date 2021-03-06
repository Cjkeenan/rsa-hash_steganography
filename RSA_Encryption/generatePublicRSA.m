% Python Code
% def generatePublic(p,q):
%     n = p*q
%     phi = (p-1)*(q-1)
% 
%     e = 2
%     while(euclidAlgo(e,phi) != 1):
%         e = e+1
%     if(e >= phi):
%         return( "not possible since e < phi(n), phi(n)={0} and e = {1}" .format(phi,e))
%     return e

function [encryptionPublicKey] = generatePublicRSA(p,q)
%GENERATE_PUBLIC_RSA: This function implements the RSA decryption key
%generation algorithm to generate a public encryption key given two random
%relatively prime numbers p and q
%   Input: Two relatively prime numbers p and q
%   Output: Public Encryption Key
    n = p*q;
    phi = (p-1)*(q-1);
    
    bits = 50;
    scalar = 2^bits;
    encryptionPublicKey = scalar;
    
    while(euclidAlgo(encryptionPublicKey,phi) ~= 1)
        encryptionPublicKey = mod(encryptionPublicKey + round(scalar*randn),phi);
    end
    if(encryptionPublicKey >= phi)
        encryptionPublicKey = "NaN";
    end
end

