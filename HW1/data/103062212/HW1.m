clear;
img = imread('lalaland.png');

im1 = uint8(IDCT(DCT(img, 8, 2), 8));
im2 = uint8(IDCT(DCT(img, 8, 4), 8));
im3 = uint8(IDCT(DCT(img, 8, 8), 8));



imshow(img);
pause;

computePSNR(img, im1)
imshow(im1);
pause;

computePSNR(img, im2)
imshow(im2);
pause;

computePSNR(img, im3)
imshow(im3);
pause;

imwrite(im1, 'img1_a_1.png');
imwrite(im2, 'img1_a_2.png');
imwrite(im3, 'img1_a_3.png');

trans = RGB2YIQ(img);

i1 = IDCT(DCT(trans, 8, 2), 8);
i2 = IDCT(DCT(trans, 8, 4), 8);
i3 = IDCT(DCT(trans, 8, 8), 8);

i1 = YIQ2RGB(i1);
i2 = YIQ2RGB(i2);
i3 = YIQ2RGB(i3);

%psnr(img,i1);
computePSNR(img, i1)
imshow(i1);
pause;

computePSNR(img, i2)
imshow(i2);
pause;

computePSNR(img, i3)
imshow(i3);
pause;

imwrite(im1, 'img1_b_1.png');
imwrite(im2, 'img1_b_2.png');
imwrite(im3, 'img1_b_3.png');


%---------------------------------------
img = imread('thinker_gray_noised.jpg');

imshow(img);
pause;

g = fspecial('gaussian', 3, 0.3);
im1 = spatialFiltering(img, g);

g = fspecial('gaussian', 9, 1);
im2 = spatialFiltering(img, g);

computePSNR(img, im1)
imshow(im1);
pause;

computePSNR(img, im2)
imshow(im2);
pause;

i1 = MedianFiltering(img, 3);
i2 = MedianFiltering(img, 9);

computePSNR(img, i1)
imshow(i1);
pause;

computePSNR(img, i2)
imshow(i2);
pause;

%---------------------------------------
img_in = imread('img_LR.png');
img_c = imread('img_HR.png');

im1 = resizeImage_replication(img_in, 4);
im2 = resizeImage_bilinear(img_in, 4);

computePSNR(img_c, im1)
imshow(im1);
pause;

computePSNR(img_c, im2)
imshow(im2);
pause;