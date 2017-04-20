function psnr = computePSNR(input1_s, input2_s)
    % get size
    [m n k] = size(input1_s);
    
    % calculate mse
    frameSize = m * n * k;
    mse = sum(sum(sum((double(input1_s) - double(input2_s)) .^ 2))) / frameSize;
    
    % by equation
    psnr = 10 * log10(255 * 255 / mse);

end