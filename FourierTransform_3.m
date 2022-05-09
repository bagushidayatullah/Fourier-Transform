clear all
close all
w = -5:0.1:5;
y = (sinc(w/2)).^2;
plot(w,y);
grid;
title('Representasi Transformasi Fourier untuk v(t)');
xlabel('rad/s');
ylabel('Amplitudo');
