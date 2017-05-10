%% 1 ================================================================
clear all;
ref = (im2double(imread('./data/frame72.jpg')));
tar = (im2double(imread('./data/frame73.jpg')));

tic;
motionImage = MotionEstimation(tar,ref, 8, 8, 'full');
toc;
figure, imshow(sum(abs(motionImage-tar), 3));
imwrite(motionImage,'./OutputImage/Output/frame73full8x8.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame73full8x8.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 16, 16, 'full');
toc;
figure, imshow(sum(abs(motionImage-tar), 3));
imwrite(motionImage,'./OutputImage/Output/frame73full16x16.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame73full16x16.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 8, 16, 'full');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame73full8x16.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame73full8x16.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 16, 8, 'full');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame73full16x8.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame73full16x8.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 8, 8, 'log');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame73log8x8.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame73log8x8.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 16, 16, 'log');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame73log16x16.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame73log16x16.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 8, 16, 'log');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame73log8x16.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame73log8x16.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 16, 8, 'log');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame73log16x8.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame73log16x8.jpg');
computePSNR(motionImage,tar)
pause;

tar = (im2double(imread('./data/frame81.jpg')));

tic;
motionImage = MotionEstimation(tar,ref, 8, 8, 'full');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame81full8x8.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame81full8x8.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 16, 16, 'full');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame81full16x16.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame81full16x16.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 8, 16, 'full');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame81full8x16.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame81full8x16.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 16, 8, 'full');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame81full16x8.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame81full16x8.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 8, 8, 'log');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame81log8x8.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame81log8x8.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 16, 16, 'log');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame81log16x16.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame81log16x16.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 8, 16, 'log');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame81log8x16.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame81log8x16.jpg');
computePSNR(motionImage,tar)
pause;

tic;
motionImage = MotionEstimation(tar,ref, 16, 8, 'log');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/frame81log16x8.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/frame81log16x8.jpg');
computePSNR(motionImage,tar)
pause;

%% 2 ===============================================================
clear all;

ref1 = (im2double(imread('./data/frame72.jpg')));
ref2 = (im2double(imread('./data/frame85.jpg')));
tar = (im2double(imread('./data/frame81.jpg')));

tic;
motionImage = MotionEstimationBDir(tar, ref1, ref2, 8, 8, 'log');
toc;
figure, imshow(sum(abs(motionImage-tar),3));
imwrite(motionImage,'./OutputImage/Output/bilog16x8.jpg');
imwrite(sum(abs(motionImage-tar),3), './OutputImage/DiffImage/bidlog8x8.jpg');
computePSNR(motionImage,tar)
pause;
