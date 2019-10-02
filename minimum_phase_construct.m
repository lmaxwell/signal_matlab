
load mtlb

%%
spec=[1,1,1e-10,1,1];
x=spec;
n=length(x);
fftxabs = abs(fft(x));
if any(fftxabs == 0)
    error(message('signal:rceps:ZeroInFFT'));
end
xhat = real(ifft(log(fftxabs)));

odd = fix(rem(n,2));
wn = [1; 2*ones((n+odd)/2-1,1) ; ones(1-rem(n,2),1); zeros((n+odd)/2-1,1)];
    % class(yhat) must be the same as that of xhat to ensure precision rules
yhat = zeros(size(x),class(xhat));
yhat(:) = real(ifft(exp(fft(wn.*xhat(:)))));

figure;
subplot(2,1,1);
plot(x);
subplot(2,1,2);
plot(yhat);