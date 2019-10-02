spec = [1 1 1 1e-10 1e-10 1e-10 1 1]'; % Lowpass cutting off at fs*3/8
format short;
mps(spec)
abs(mps(spec))
ifft(spec)
ifft(mps(spec))