function [imageEncoded,imageSize] = encodeHashRSA(publicEncryptionKey,modulo,image,text)
%ENCODE_HASH_RSA: 
%   Input: 
%   Output: 
    
    textEncoded = double(char(text));
    textEncrypted = encryptRSA(textEncoded,publicEncryptionKey,modulo);
    %convert to uint64 to save char space
    textEncryptedL = uint64(textEncrypted);
    
    [a,b] = size(textEncryptedL);
    %null string to store everything
    totalStr = ""; 
    for i = 1:1:b
        totalStr =strcat(totalStr,num2str(textEncrypted(i))," ");
    end
    
    sM = char(totalStr);
    [imageEncoded, imageSize] = Picencode(image,sM);
end