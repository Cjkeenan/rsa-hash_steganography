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
%GENERATE_PRIVATE_RSA: This function implements the RSA encyption key
%generation algorithm to generate a private decryption key given the public
%encryption key and the modulo base
%   Input: Public Encryption key, modulo base
%   Output: Private Decryption key
    phi = eulerPhi(modulo);
    gcd = euclidAlgo(encryptionPublicKey,phi);
    if(gcd == 1)
        [g,s,t] = extEuclidAlgo(encryptionPublicKey,phi);
        decryptionPrivateKey = mod(s,phi);
    else
        decryptionPrivateKey = "NaN";
    end
end

