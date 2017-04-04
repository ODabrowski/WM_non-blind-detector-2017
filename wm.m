%%%Oscar Dabrowski%%%
clc;
clear all;
x=rgb2gray(imread('clena.jpg'));
[sx,sy]=size(x);
%%%%%%%%%%%%%%%%%%%%
gamma=5;%wm strength
%%%%%%%%%%%%%%%%%%%%
theta=0.5;%density
w=gamma*round(rand(sx,sy));
w(find(w==0))=-gamma;%replace 0 values by -1
indexes=randsample(sx*sy,round((sx*sy*theta)));%randomly choose density(here half) of the pixels to watermark them

%Embed watermark
y=x;
y(indexes)=double(x(indexes))+double(w(indexes));
%save a copy of watermarked image
imwrite(y,'watermarkedImage.png');

subplot(1,2,1);imshow(x);title('Host image (no WM)');

subplot(1,2,2);imshow(y);title('Watermarked image');
