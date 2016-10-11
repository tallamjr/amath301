clear all

%% create a simple signal with two frequencies
dt = .001;
t = 0:dt:1;
x = sin(2*pi*50*t) + sin(2*pi*120*t);

figure(1)
subplot(2,1,1)
plot(t,x,'LineWidth',1.2)

%%  add some noise
y = x + 2.5*randn(size(t));
hold on
plot(t,y,'r')
axis([0 .25 -5 5])
legend('Clean','Noisy')

%% Compute the Fast Fourier Transform FFT
figure
N = length(t);
Y = fft(y,N);  % computes the (fast) discrete fourier transform
PSD = Y.*conj(Y)/N;  % Power spectrum (how much power in each freq)
freq = 1/(dt*N)*(0:N);  %create the x-axis of frequencies in Hz
L = 1:floor(N/2);  % only plot the first half of freqs
plot(freq(L),PSD(L))
title('Power spectral density')
xlabel('Frequency (Hz)')

%% Use the PSD to filter out noise
indices = PSD>50;  % find all freqs with large power
PSD = PSD.*indices;  % zero out all others
hold on
plot(freq(L),PSD(L),'r') 
legend('original','filtered')

Y = indices.*Y;  % zero out small Fourier coefficients in Y
yfilt = ifft(Y);     % inverse FFT to get filtered time-domain signal

figure(1)
subplot(2,1,2)
plot(t,x,'b','LineWidth',1.2)
hold on
plot(t,yfilt,'r')
axis([0 .25 -5 5])
legend('Clean','Filtered')

 %% play sound
sound(y,1/dt)