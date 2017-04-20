%%% HW2_Q1.m - Complete the procedure of separating HW2_mix.wav into 3 songs

%% Clean variables and screen
close all;
clear;
clc;

%% Visualization parameters (Change it if you want)
% Some Tips:
% (Tip 1) You can change the axis range to make the plotted result more clearly 
% (Tip 2) You can use subplot function to show multiple spectrums / shapes in one figure
titlefont = 15;
fontsize = 13;
LineWidth = 1.5;

%% 1. Read in input audio file ( audioread )
% y_input: input signal, fs: sampling rate
[y_input, fs] = audioread('audio/HW2_Mix.wav');

%%% Plot example : plot the input audio
% The provided function "make_spectrum" generates frequency
% and magnitude. Use the following example to plot the spectrum.
hold on
[frequency, magnitude] = make_spectrum(y_input, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Input', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);
xlim([0 2000]);
ylim([0 30000]);


%% 2. Filtering 
% (Hint) Implement my_filter here
[Merry, MerryFilter] = my_filter(y_input, fs, 501, 'Blackmann', 'bandpass', [530 540]);
[Bee, BeeFilter] = my_filter(y_input, fs, 501, 'Blackmann', 'lowpass', 260);
[Tiger, TigerFilter] = my_filter(y_input, fs, 501, 'Blackmann', 'highpass', 850);

%%% Plot the shape of filters in Time domain
figure;
plot(1:501, MerryFilter, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Lamp Time Filter', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);

figure;
plot(1:501, BeeFilter, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Bee Time Filter', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);

figure;
plot(1:501, TigerFilter, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Tiger Time Filter', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);

%%% Plot the spectrum of filters (Frequency Analysis)
figure;
[frequency, magnitude] = make_spectrum(MerryFilter, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Lamp Freq Filter', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);
xlim([0 2000]);

figure;
[frequency, magnitude] = make_spectrum(BeeFilter, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Bee Freq Filter', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);
xlim([0 2000]);

figure;
[frequency, magnitude] = make_spectrum(TigerFilter, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('Tiger Freq Filter', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);
xlim([0 2000]);
%% 3. Save the filtered audio (audiowrite)
% Name the file 'FilterName_para1_para2.wav'
% para means the cutoff frequency that you set for the filter

% audiowrite('FilterName_para1_para2.wav', output_signal1, fs);
audiowrite('Bandpass_530_540.wav', Merry, fs);
audiowrite('Lowpass_260.wav', Bee, fs);
audiowrite('Highpass_850.wav', Tiger, fs);
%%% Plot the spectrum of filtered signals
figure;
[frequency, magnitude] = make_spectrum(Merry, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('LittleLamp', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);
xlim([0 2000]);

figure;
[frequency, magnitude] = make_spectrum(Bee, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('LittleBee', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);
xlim([0 2000]);

figure;
[frequency, magnitude] = make_spectrum(Tiger, fs);
plot(frequency, magnitude, 'LineSmoothing', 'on', 'LineWidth', LineWidth); 
title('TwoTiger', 'fontsize', titlefont);
set(gca, 'fontsize', fontsize);
xlim([0 2000]);