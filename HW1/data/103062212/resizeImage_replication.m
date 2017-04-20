function [ resize_picture ] = resizeImage_replication ( input_picture ,factor )
%ZOOMBYPIXELREPLICATION Summary of this function goes here
%   Detailed explanation goes here

    % initial row, col
    [height, width, channel] = size(input_picture);
   
    % initial output by mul factor
    newWidth = round(factor * width);
    newHeight = round(factor * height);
    
    resize_picture = zeros(newWidth, newHeight, channel);
        
    % start
    [cf, rf] = meshgrid(1:newWidth, 1:newHeight);

    % element remapping original row, col
    rf = (rf / factor);
    cf = (cf / factor);

    % pick the nearest one
    r = round(rf);
    c = round(cf);

    % clamp it 
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > height) = height;
    c(c > width) = width;

    % get the idx matrix
    in_ind = sub2ind([height, width], r, c);
    
    % assign to each color channel
    for i = 1:channel
        
        tmp = input_picture(:,:,i);
       
        % use idx and transfer to output
        resize_picture(:,:,i) = tmp(in_ind);
    end
    
    %resize_picture = cast(resize_picture, class(input_picture));
    
end

