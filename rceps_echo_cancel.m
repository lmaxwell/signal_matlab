
%%
load mtlb;


%%
timelag = 0.23;
delta = round(Fs*timelag);
alpha = 0.5;

orig = [mtlb;zeros(delta,1)];
echo = [zeros(delta,1);mtlb]*alpha;

mtEcho = orig + echo;

t = (0:length(mtEcho)-1)/Fs;

subplot(2,1,1)
plot(t,[orig echo])
legend('Original','Echo')

subplot(2,1,2)
plot(t,mtEcho)
legend('Total')
xlabel('Time (s)')

%%
c = rceps(mtEcho);

[px,locs] = findpeaks(c,'Threshold',0.2,'MinPeakDistance',0.2);

clf
plot(t,c,t(locs),px,'o')
xlabel('Time (s)')

%%
dl = locs(2)-1;

mtNew = filter(1,[1 zeros(1,dl-1) alpha],mtEcho);

subplot(2,1,1)
plot(t,orig)
legend('Original')

subplot(2,1,2)
plot(t,mtNew)
legend('Filtered')
xlabel('Time (s)')
