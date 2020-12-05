%Mean Filter%
clc;
clear all;
close all;

I=imread('strawberry.png');        %reading image
Img=rgb2gray(I);                    %convert rgb to gray%
variance = input('enter the value of variance: ')
N = imnoise(Img,'salt & pepper',variance);  %adding noise %

[m,n]=size(N);    %calculating size
output=zeros(m,n);   %returns mxn matrix of zeros

    for i=1:m          %for row
    for j=1:n            %for column
        rmin=max(1,i-1);
        rmax=min(m,i+1);   %set the neighbour boundaries%
        cmin=max(1,j-1);
        cmax=min(n,j+1);
        %neighborhood matrix,denoting by temp
        temp=N(rmin:rmax,cmin:cmax);
        %with pixel of output will be the avg of neighborhood
        output(i,j)=mean(temp(:));
        
    end
    end


output=uint8(output);     %converting output to uint8[unsigned integer]%

subplot(2,2,1);
imshow(I);
title("Original image");
subplot(2,2,2);
imshow(N);
title("Image corrupted with salt and pepper noise");
subplot(2,2,3);
imshow(output);
title("Image after using Mean filter");


