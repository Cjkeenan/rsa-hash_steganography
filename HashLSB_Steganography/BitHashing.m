clc;
close all;
%image to be read
I = imread('image.jpg');
%message to be encoded
sM = 'To be, or not to be- that is the question: Whether tis nobler in the mind to suffer The slings and arrows of outrageous fortune Or to take arms against a sea of troubles, And by opposing end them. To die- to sleep- No more; and by a sleep to say we end The heartache, and the thousand natural shocks That flesh is heir to. Tis a consummation Devoutly to be wishd. To die- to sleep. To sleep- perchance to dream: ay, theres the rub!';
%encode
[Ix, sizeX] = Picencode(I,sM);
%decode
msg = Picdecode(Ix,sizeX);