function [ resize_picture ] = resizeImage_bilinear( input_picture ,factor )
    
    % initial row, col
    [height, width, channel] = size(input_picture);
   
    % initial output by mul factor
    newWidth = round(width * factor);  
    newHeight = round(height * factor);
    
    resize_picture = zeros(newWidth, newHeight, channel);
    
    % use meshgrid and start to do resize
    [cf,rf] = meshgrid(1 : newWidth, 1 : newHeight);
    
    cf = cf - 0.5;
    rf = rf - 0.5;
    % make output image remapping original row, col
    rf = (rf / factor);
    cf = (cf / factor);
    
    cf = cf + 0.5;
    rf = rf + 0.5;
    
    % to an integer point
    r = round(rf);
    c = round(cf);
    
    % clamp it inside the matrix
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > height - 1) = height-1;
    c(c > width - 1) = width-1;
    
    % delta actual point and int point
    d_r = rf - r;
    d_c = cf - c;
    
    % get the matrix of each point's four neighbor idx
    in1_ind = sub2ind([height, width], r, c);
    in2_ind = sub2ind([height, width], r+1,c);
    in3_ind = sub2ind([height, width], r, c+1);
    in4_ind = sub2ind([height, width], r+1, c+1);   
    
    for i = 1:channel
    
    % type transfer
    temp = double(input_picture(:,:,i));
    
    % do bilinear
    resize_picture(:,:,i) = temp(in1_ind).*(1 - d_r).*(1 - d_c) + ...
                       temp(in2_ind).*(d_r).*(1 - d_c) + ...
                       temp(in3_ind).*(1 - d_r).*(d_c) + ...
                       temp(in4_ind).*(d_r).*(d_c);
    
    end
    
    % cast back original type
    resize_picture = cast(resize_picture, class(input_picture));
end

