%% This is a prgram to visualize how SNR of received signal at Radar
%% Receiver changes as a function of Range.

clc, clear all, close('all');

%% User inputs

Pt = 10*log10(1.5 * 10 ^6);
tao = 0.2 * 10 ^-6;
fo = 5.6 * 10 ^9;
G = 45; % in dB
To = 10*log10(290);
F = 3.0; % Noise figure of Receiver in dB
sigma = 10*log10(0.1); % Radar Cross Section in dB
Loss = 6.0; % Radar Loss in dB

%% Computation of parameters
Bandwidth = 10*log10(1/tao);
Lemda = 10*log10( ((3*10^8) / fo )^2);
k = 10*log10(1.38 * 10^-23);
Range = linspace(25e3,165e3,1000);
R = 10*log10(Range.^4);
Numerator = Pt + 2*G + Lemda + sigma;
Denominator = 10*log10((4*pi)^3) + k + To + Bandwidth + Loss + R;
SNR = Numerator - Denominator;
plot(Range/1000,SNR,'r','linewidth',2);title('SNR vs Range Plot of Radar Equation'),xlabel('Range in Km'),ylabel('SNR in dB');
grid on;
