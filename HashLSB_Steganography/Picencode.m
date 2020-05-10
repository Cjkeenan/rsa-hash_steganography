function [Imo, sizeO] = Picencode(Im,msg)
[R,C,P] = size(Im);
[s,sizeM] = size(msg);
sizeB = sizeM*7;
pixelcount = 1;
sizeO = sizeB;
pixel = 1;
row = 1;
col = 1;
arr = zeros(sizeM,1);
figure, imshow(Im); title('Original Image');
bitC = 1;
bytC = 1; 
bitA = 1; 
for i = 0:1:sizeB-1
    bitValue = bitget(uint8(msg(bytC)),bitC);
    bitC=bitC+1;
    if bitC == 8
        bitC =1;
        bytC = bytC+1; 
    end
    arr(i+1) = bitValue;
    if pixelcount < 4
    Im(row,col,pixel)=bitset(Im(row,col,pixel),bitA,bitValue);
    pixelcount=pixelcount+1;
    bitA = bitA+1;
    elseif pixelcount < 6
    Im(row,col,pixel)=bitset(Im(row,col,pixel),bitA,bitValue);
    pixelcount=pixelcount+1;
    bitA = bitA+1;
    elseif pixelcount < 8
    Im(row,col,pixel)=bitset(Im(row,col,pixel),bitA,bitValue);
    pixelcount=pixelcount+1;
    bitA = bitA+1;
    end
    if pixelcount == 4
        pixel = pixel+1;
        bitA =1;
    elseif pixelcount == 6
        pixel = pixel+1;
        bitA =1;
    elseif pixelcount == 8
        pixelcount = 1;
        pixel = 1; 
        col = col+1;
        bitA =1; 
    end
    if col > C
        col = 1;
        row = row+1; 
    end
end
Imo = Im;
end
