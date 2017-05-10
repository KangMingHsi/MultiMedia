function psnr = computePSNR(input1_s,input2_s)

    mseImage = (double(input1_s) - double(input2_s)) .^ 2;
    [a,b] = size(input1_s);
    framesize = a * b;
    mse = sum(mseImage(:)) / framesize;
    psnr = 10 * log10( 1 / mse);

end

