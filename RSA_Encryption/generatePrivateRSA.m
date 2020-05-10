% Python Code
% def generatePrivate(e,n):
%     phi = eulerPhi(n)
%     gcd = euclidAlgo(e,phi)
%     if(gcd == 1):
%         d = extEuclidAlgo(e,phi)[1]
%     else:
%         return ("not possible since the gcd of {0} and {1} is {2} and not 1" .format(e,phi,gcd))
% 
%     return d

function [decryptionPrivateKey] = generatePrivateRSA(encryptionPublicKey,modulo)
%GENERATEPRIVATERSA Summary of this function goes here
%   Detailed explanation goes here
    phi = eulerPhi(modulo);
    gcd = euclidAlgo(encryptionPublicKey,phi);
    if(gcd == 1)
        [g,s,t] = extEuclidAlgo(encryptionPublicKey,phi);
        decryptionPrivateKey = mod(s,phi);
    else
        decryptionPrivateKey = "NaN";
    end
end

