


N = 128;
x = sin(2*pi*0.1*[0:N-1]);
X = fft(x);
Xi = specinterp(X,[1:0.5:N]); % upsample by 2
xi = ifft(Xi); % should now see 2x zero-padding

figure;
subplot(4,1,1);
plot(x);
subplot(4,1,2);
plot(real(xi))
subplot(4,1,3);
plot(real(X));
subplot(4,1,4);
plot(real(Xi))