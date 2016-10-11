clear all
% DUE TO COPYRIGHT INFRINGEMENT, I AM NOT ALLOWED TO UPLOAD LED ZEPPELIN
% also, need to download mp3read from 
% http://www.mathworks.com/matlabcentral/fileexchange/13852-mp3read-and-mp3write
[Y,FS,NBITS,OPTS] = mp3read('Zep.mp3'); % add in your own song

T = 5; % 8 seconds
L = 1:T*FS;

time = L/FS;
y=Y(L); % first few seconds

%%
plot(time,y)
xlabel('Time (s)')
ylabel('Amplitude')

%%
% sound(y,FS); 

%%

spectrogram(y,1000,500,1000,FS,'yaxis')

