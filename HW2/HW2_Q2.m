%%% HW2_Q2.m - Music classification through spectrograms and human eyes

%% Clean variables and screen
close all;
clear;
clc;

%% Initialize
class_labels = {'Guitar', 'Piano', 'Violin', 'Drum'};
audio_files = {'audio/guitar_01.wav', 'audio/guitar_02.wav', 'audio/guitar_03.wav', ...
               'audio/piano_01.wav', 'audio/piano_02.wav', 'audio/piano_03.wav', ...
               'audio/violin_01.wav', 'audio/violin_02.wav', 'audio/violin_03.wav', ...
               'audio/drum_01.wav', 'audio/drum_02.wav', 'audio/drum_03.wav'};

class_num = length(class_labels);
instance_num = length(audio_files) / class_num;
cut_duration = 3;

spectrograms = cell(1, length(audio_files));
spectrogram_images = cell(1, length(audio_files));

%% Plot and save spectrograms
for i = 1 : length(audio_files)
    audio_file = audio_files{i};
    
    % The function "my_spectrogram" will call "my_stft" function, and you
    % have to implement the details in "my_stft" so that "my_spectrogram"
    % can plot and get the spectrogram image
    spectrogram_images{i} = my_spectrogram(audio_file, cut_duration);
    
    % Remember to save the spectrograms
    % Hint: imwrite
    % Name the file 'InstrumentName_para.png'
    % para means the serial number, i.e. guitar_01.png for guitar_01.wav
    startP = strfind(audio_file, '/') + 1;
    endP = strfind(audio_file, '.') - 1;
    
    imwrite(spectrogram_images{i}, [audio_file(startP:endP)  '.png']);
end

%% Load the test spectrogram of the test audio file
test_num = 4;

for i = 1 : test_num
    test_file = ['test_spectrogram/test_spectrogram_', num2str(i), '.png'];
    test_spectrogram_image = imread(test_file);
    figure;
    imshow(test_spectrogram_image);
end
hold off;