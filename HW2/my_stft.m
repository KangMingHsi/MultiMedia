function [S, F, T] = my_stft(x, segment_duration, segment_overlap, samplerate)
% my_stft:
% input
% x: The target signal.
% segment_duration: The number of samples of each segment.
% segment_overlap: The number of samples overlapping on two adjacent segments.
%
% output
% S: Short-time Fourier transform, returned as a matrix. Time increases across the columns of S and frequency increases down the rows, starting from zero.
% F: Cyclical frequencies, returned as a vector. F has a length equal to the number of rows of S.
% T: Time instants, returned as a vector. The time values in T correspond to the midpoint of each segment.

%% Your implementation
startmid = (segment_duration / 2);
unit = (segment_duration - segment_overlap);
range = length(x);
win = (hamming(segment_duration, 'periodic'));

N = floor((range - segment_overlap) / unit);
S = [];

startPoint = 1:unit:range;

for i = 1:N
   seg = x(startPoint(i): startPoint(i)+segment_duration-1);
   temp = seg .* win;
    
   S = [S fft(temp)];
end

T = (startmid:unit:range) / samplerate ;
F = (0:(N-1) * (samplerate / segment_duration));
