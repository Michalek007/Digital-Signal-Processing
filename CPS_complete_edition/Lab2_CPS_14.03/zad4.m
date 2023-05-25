clc; clear; close all;

im = imread('cameraman.tif');
imshow(im);
pause;
im2 = abs(256 - im);
imshow(im2);
pause;

im3 = im(:,end:-1:1);
imshow(im3);
pause;

imhist(im);
pause;