function [msg] = Picdecode(Im,sizeO)
%Im     - input image
%sizeo  - number of bytes give by Picencode
%msg    - output message decoded from image 
ArC = blanks(sizeO/7);
[R,C,P] = size(Im);
bitC = 1;
row = 1;
col = 1;
pixel = 1; 
red = 1;
green = 0;
blue = 0;
byteA = 1;
bitA = 1; 
figure, imshow(Im); title('Hidden Message');
for i = 0:1:sizeO-1
   if(red == 1)
     bitValue = bitget(Im(row,col,pixel),bitC);
     bitC = bitC+1;
     if(bitC > 3)
         pixel = pixel+1;
         red = 0;
         green = 1;
         bitC = 1;
     end
    elseif(green == 1)
     bitValue = bitget(Im(row,col,pixel),bitC);
     bitC = bitC+1;
     if(bitC > 2)
         pixel = pixel+1;
         green = 0;
         blue = 1;
         bitC = 1;
     end
   elseif(blue == 1)
     bitValue = bitget(Im(row,col,pixel),bitC);
     bitC = bitC+1;
     if(bitC > 2)
         pixel = 1;
         col = col+1;
         red = 1;
         blue = 0;
         bitC = 1;
         if col > C
             col = 1;
             row = row+1;
         end
     end
   end
    ArC(byteA) = bitset(uint8(ArC(byteA)),bitA,bitValue);
    bitA =bitA+1;
    if bitA > 7
        byteA = byteA+1;
        bitA = 1;
    end 
end
msg = ArC;
end