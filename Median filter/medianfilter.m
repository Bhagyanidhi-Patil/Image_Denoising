%Median Filter%

clc;
clear all;
close all;

variance = input('enter the value of variance: ');%value of variance
window = input('enter the window size: ');%window size
im = imread('strawberry.png');   %reading image

N = imnoise(im,'salt & pepper',variance);  %adding noise

b=N;
[r,c]=size(b);     %calculating size


%3*3 window size
if( window == 3)
    for k=2:r-1
        for l=2:c-1          %taking all neighbouring elements%
            arr = [b(k-1,l-1) b(k-1,l) b(k-1,l+1) b(k,l-1) b(k,l) b(k,l+1) b(k+1,l-1) b(k+1,l) b(k+1,l+1)];
            narr = sort(arr);
            b(k,l) = narr(5);
        end
    end
%5*5 window size
elseif(window == 5)
    for k=3:r-2
        for l=3:c-2
            arr = [b(k-2,l-2) b(k-2,l-1) b(k-2,l) b(k-2,l+1) b(k-2,l+2) b(k-1,l-2) b(k-1,l-1) b(k-1,l) b(k-1,l+1) b(k-1,l+2) b(k,l-2) b(k,l-1) b(k,l) b(k,l+1) b(k,l+2) b(k+1,l-2) b(k+1,l-1) b(k+1,l) b(k+1,l+1) b(k+1,l+2) b(k+2,l-2) b(k+2,l-1) b(k+2,l) b(k+2,l+1) b(k+2,l+2)];
            narr = sort(arr);
            b(k,l) = narr(13);
        end
    end
%7*7 window size
elseif(window == 7)
    for k=4:r-3
        for l=4:c-3
            arr = [b(k-3,l-3) b(k-3,l-2)  b(k-3,l-1)  b(k-3,l)  b(k-3,l+1)  b(k-3,l+2)  b(k-3,l+3)  b(k-2,l-3)  b(k-2,l-2)  b(k-2,l-1)  b(k-2,l)  b(k-2,l+1)  b(k-2,l+2)  b(k-2,l+3)  b(k-1,l-3)  b(k-1,l-2)  b(k-1,l-1)  b(k-1,l)  b(k-1,l+1)  b(k-1,l+2)  b(k-1,l+3)  b(k,l-3)  b(k,l-2)  b(k,l-1) 1*b(k,l)  b(k,l+1)  b(k,l+2)  b(k,l+3)  b(k+1,l-3)  b(k+1,l-2)  b(k+1,l-1)  b(k+1,l)  b(k+1,l+1)  b(k+1,l+2)  b(k+1,l+3)  b(k+2,l-3)  b(k+2,l-2)  b(k+2,l-1)  b(k+2,l)  b(k+2,l+1)  b(k+2,l+2)  b(k+2,l+3)  b(k+3,l-3)  b(k+3,l-2)  b(k+3,l-1)  b(k+3,l)  b(k+3,l+1)  b(k+3,l+2)  b(k+3,l+3)];
            narr = sort(arr);
            b(k,l) = narr(25);
        end
    end
end


subplot(2,2,1);
imshow(im);
title("Original image");
subplot(2,2,2);
imshow(N);
title("Image corrupted with salt and pepper noise");
subplot(2,2,3);
imshow(b);
title("Image after using Median filter");

