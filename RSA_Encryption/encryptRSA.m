% Python Code
% def encryptRSA(x,e,n):
%     return pow(x,e,n)

function [encrypted] = encryptRSA(plainText,publicKey,modulo)
%ENCRYPTRSA Summary of this function goes here
%   Detailed explanation goes here
    encrypted = powermod(plainText,publicKey,modulo);
end

