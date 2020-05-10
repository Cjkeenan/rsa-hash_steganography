clear; close all;
addpath('RSA-Hash_Steganography');
addpath('HashLSB_Steganography');
addpath('RSA_Encryption');
p = 215417;
q = 124513;
bits = 64;
image = imread('image.jpg');
text = "To be, or not to be- that is the question: Whether 'tis nobler in the mind to suffer The slings and arrows of outrageous fortune Or to take arms against a sea of troubles, And by opposing end them. To die- to sleep- No more; and by a sleep to say we end The heartache, and the thousand natural shocks That flesh is heir to. 'Tis a consummation Devoutly to be wish'd. To die- to sleep. To sleep- perchance to dream: ay, there's the rub!";
[e,d,n] = generateRSAkeys(p,q,bits);

[imageEncoded, imageSize] = encodeHashRSA(e,n,image,text);
textDecoded = decodeHashRSA(d,n,imageEncoded,imageSize);