function [textDecoded] = decodeHashRSA(privateDecryptionKey,modulo,imageEncoded,imageSize)
%DECODEHASHRSA Summary of this function goes here
%   Detailed explanation goes here

    textEncChar = Picdecode(imageEncoded,imageSize);
    textEncStr = convertCharsToStrings(textEncChar);
    textEncSplit = split(textEncStr);
    [c,e] = size(textEncSplit);
    
    textEnc = str2double(textEncSplit);
    textEnc(c) = [];
    textEnc = textEnc.';
    
    textDecrypted = decryptRSA(textEnc,privateDecryptionKey,modulo);
    textDecoded = string(char(textDecrypted));
end

