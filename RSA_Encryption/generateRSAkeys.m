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
% 
% def generatePrivate(e,n):
%     phi = eulerPhi(n)
%     gcd = euclidAlgo(e,phi)
%     if(gcd == 1):
%         d = extEuclidAlgo(e,phi)[1]
%     else:
%         return ("not possible since the gcd of {0} and {1} is {2} and not 1" .format(e,phi,gcd))
% 
%     return d

function [encryptionPublicKey,decryptionPrivateKey,n] = generateRSAkeys(p,q,bits)
%GENERATERSAKEYS: This function generates both the public encryption key
%and the private decryption key for two given relatively prime numbers p
%and q of a size around 2^bits
%   Input: Two relatively prime numbers p and q, intended bits for key
%   Output: Public encryption key, private decryption key, and the
%   mutliplication of the two relatively prime numbers
    % Public Key Generation
    n = p*q;
    phi = (p-1)*(q-1);
    
    scalar = 2^bits;
    encryptionPublicKey = scalar;
    
    [gcd,s,t] = extEuclidAlgo(encryptionPublicKey,phi);
    while(gcd ~= 1)
        encryptionPublicKey = mod(encryptionPublicKey + round(scalar*randn),phi);
        [gcd,s,t] = extEuclidAlgo(encryptionPublicKey,phi);
    end
    
    % Private Key Generation
    decryptionPrivateKey = mod(s,phi);
end

