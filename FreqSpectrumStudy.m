%% Study of frequency spectrum of composite signals
clc, clear all, close('all');
t = linspace(0,1/20,50000);
x1 = sin(2*pi*50*t);
x2 = sin(2*pi*50.5*t);
x = x1 + x2; 
figure,
plot(t,x1);
hold on;
plot(t,x2,'r');
plot(t,x,'g');
X = fft(x);
figure,plot(fftshift(abs(X)));