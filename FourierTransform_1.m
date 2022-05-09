clear all
close all
nmax = 30;
T0 = 2;
w0 = pi;
t = -3:0.01:3;
nsample = length(t);
a0 = 1;
for n=1:nmax
    an(n) = 0; %Pada isyarat r(t) nilai a(n) adalah (4-4(cos(n*pi/2))/2)
    bn(n) = (1/(n*pi))*(1-cos(n*pi));
end

x1=ones(nsample,1);
x1=x1*a0/2;
for i=1:nsample,1
    for n=1:nmax
        x1(i)=x1(i)+an(n)*cos(n*pi*t(i))+bn(n)*sin(n*pi*t(i));
    end
end

n=1:nmax;
A0=a0;
An=sqrt(an.^2+bn.^2);
thn=atan2(-bn, abs(an))*180/pi;
th0=0;
X0=A0;
Xn=An;

%gambarx(t)
figure()
plot(t,x1);
axis([-3 3 -.5 1.5]), xlabel('Waktu(s)'), ylabel('Amplitude'),
title('RepresentasiDeret Fourier untuk x(t) dengan 10 harmonik');

%gambarOn
figure()

subplot(2,1,1)
stem(0,X0); hold on;
stem(n,Xn);
stem(-n, Xn);
hold off
axis([-nmax nmax -0.1 1.1]);
xlabel('Frekuensi (rad/s)');
ylabel('Magnitude'), title('Magnitude spektrumgaris cn');

subplot(2,1,2)
stem(0, th0); hold on;
stem(-n,-thn);
stem(n, thn);

hold off
axis([-nmax nmax -100 100]);
xlabel('Frekuensi (pi rad/s)');
ylabel('Fase (deg)'), title('Fasespektrumgaris cn');

