% Python Code
% def encryptRSA(x,e,n):
%     return pow(x,e,n)

function [encrypted] = encryptRSA(plainText,publicKey,modulo)
%ENCRYPTRSA This function takes plaint text and encrypts it using the
%public encryption key of the recipient
%   Input: Plain Text, Public key of the intended recipient, modulo base 
%   used for encryption
%   Output: Encrypted text
    encrypted = powermod(plainText,publicKey,modulo);
end

