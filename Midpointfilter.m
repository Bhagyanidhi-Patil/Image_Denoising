%Mid-point Filter [to remove gaussian noise]%

clc;
close all;
clear all;
img=imread('strawberry.png');


grayimg=im2double(rgb2gray(img));   %convert to double format and gray scale
                                       %so we can easily add noise 
noise_img=imnoise(grayimg,'gaussian');  %adding noise



paddedimg=padarray(grayimg,[1,1]);     %pad the image so no data loss
[r,c]=size(paddedimg);        %calculate size

for i=2:r-1;
    for j=2:c-1
        out=[paddedimg(i-1,j-1), paddedimg(i-1,j), paddedimg(i-1,j+1), paddedimg(i,j-1), paddedimg(i,j) ,paddedimg(i,j+1) ,paddedimg(i-1,j) ,paddedimg(i+1,j-1) ,paddedimg(i+1,j) ,paddedimg(i+1,j+1)];
            
       a=max(out);
       b=min(out);                  %use for loop for mid-point
         
       outimg(i,j)=(a+b)/2;
    end
end
u=outimg;


subplot(2,2,1);
imshow(img);
title("Original image");
subplot(2,2,2);
imshow(noise_img);
title("Image corrupted with guassian noise");
subplot(2,2,3);
imshow(grayimg);
title("Grey image");
subplot(2,2,4);
imshow(u);
title("Filtered image");

