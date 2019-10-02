function [ sm ] = mps( s )
%MPS Summary of this function goes here
%   Detailed explanation goes here

% [sm] = mps(s) 
% create minimum-phase spectrum sm from spectrum amplitude(or complex specturm) s 
   sm = exp( fft( fold( ifft( log( clipdb(s,-100) )))));

end

function [clipped] = clipdb(s,cutoff)
% [clipped] = clipdb(s,cutoff)
% Clip magnitude of s at its maximum + cutoff in dB.
% Example: clip(s,-100) makes sure the minimum magnitude
% of s is not more than 100dB below its maximum magnitude.
% If s is zero, nothing is done.

    clipped = s;
    as = abs(s);
    mas = max(as(:));
    if mas==0, return; end
    if cutoff >= 0, return; end
    thresh = mas*10^(cutoff/20); % db to linear
    toosmall = find(as < thresh);
    clipped = s;
    clipped(toosmall) = thresh;
end  

