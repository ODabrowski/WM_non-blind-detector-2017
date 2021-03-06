%%%Oscar Dabrowski%%%
clc;
clear all;
x=rgb2gray(imread('clena.jpg'));
[sx,sy]=size(x);
%%%%%%%%%%%%%%%%%%%%
gamma=5;%wm strength
%%%%%%%%%%%%%%%%%%%%
theta=0.5;%density
wPrime=gamma*round(rand(sx,sy));
wPrime(find(wPrime==0))=-gamma;%replace 0 values by -1
indexes=randsample(sx*sy,round((sx*sy*theta)));%randomly choose density(here half) of the pixels to watermark them

%watermark w
wPrime=wPrime(:);%vectorize
wPrime(indexes)=0;%only half of the image is watermarked, other half is set to 0
w=reshape(wPrime,[512 512]);

%Embed watermark
y=x+uint8(w);
%save a copy of watermarked image
imwrite(y,'watermarkedImage.png');

subplot(1,2,1);imshow(x);title('Host image (no WM)');

subplot(1,2,2);imshow(y);title('Watermarked image');

%save wm to mat file
save(['w' int2str(gamma) '.mat'],'w');
