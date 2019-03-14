function [freq xdft power] = FFT_DATA(x, sampleFrequency)

% Sampling Frequency
Fs = sampleFrequency;

% Simple FFT
fftx = fft(x);
% sumfftx = fftx(1);
fftx(1) = [];

% Scaling
nL = length(x);

% Energy Spectrum
power = abs(fftx(1:floor(nL/2))*2/nL).^2.;
freq = Fs.*(1:floor(nL/2))/floor(nL);  

% Turbulent Spectrum
P2 = abs(fftx/nL);
P1 = P2(1:floor(nL/2));
P1(2:end-1) = 2*P1(2:end-1);

freq = freq';
xdft = P1;
% xdft = power;


end