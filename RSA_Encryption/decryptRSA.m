% Python Code
% def decryptRSA(y,d,n):
%     return pow(y,d,n)

function [decrypted] = decryptRSA(encrypted, privateKey, modulo)
%DECRYPTRSA Summary of this function goes here
%   Detailed explanation goes here
    decrypted = powermod(encrypted,privateKey,modulo);
end

