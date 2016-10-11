clear all; close all

dt = .001;
T = 0:dt:2;
X = chirp(T,100,1,200,'q');  % generate chirp signal

figure(1)
plot(T,X)
drawnow

sound(X,1/dt)

%%
figure(2)
spectrogram(X,128,120,128,1E3,'yaxis'); 
title('Quadratic Chirp');