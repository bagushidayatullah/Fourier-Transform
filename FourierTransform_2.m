close all
clear all
nmax=10;
T0=4;
w0=pi;
t=-5:0.01:5;
nsample=length(t);
a0=0.5;

for n=1:nmax
    an(n)=(4/(n^2*pi^2))* (1-cos((n*pi)/2));
    bn(n)=0;
end

x1=ones(nsample,1);
x1=x1*a0/2;
for i=1:nsample,1
    for n=1:nmax
        x1(i)=x1(i)+an(n)*cos(n*pi*t(i)/2)+bn(n)*sin(n*pi*t(i)/2);
    end
end

n=1:nmax;
A0=a0;
An=sqrt(an.^2+bn.^2);
thn=atan2(-bn,abs(an))*180/pi;
th0=0;
X0=A0;
Xn=An;

%Gambarx(t)
figure()
plot(t,x1);
axis ([-5 5 -.5 1.5]), xlabel('Waktu(s)'),ylabel('Amplitude'),
title('Representasi Deret Fourier untuk x(t) dengan 10 harmonik');

%Gambar cn
figure()

subplot(2,1,1)
stem(0,X0); hold on;
stem(n,Xn);
stem(-n,Xn);
hold off;
axis([-nmax nmax -0.1 1.1]);
xlabel('Frekuensi (rad/s)');
ylabel('Magnitude'),title('Magnitude spektrum garis cn');

subplot(2,1,2)
stem(0,th0); hold on;
stem(-n,-thn);
stem(n,thn);

hold off;
axis([-nmax nmax -100 100]);
xlabel('Frekuensi (pi rad/s)');
ylabel('Fase (deg)'),title('Fase spektrum garis cn');
