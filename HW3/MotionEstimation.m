function [ motionImage ] = MotionEstimation( Target, Ref, block_size, p, method)
    
    image_size = size(Target);
    motionImage = zeros(image_size(1), image_size(2), image_size(3));
    totalSAD = 0;
    for x = 1:block_size:image_size(1)
        for y = 1:block_size:image_size(2)
            
            if strcmp(method, 'full')
                [motion, SAD] = FullSearch(Target, Ref, block_size, p, x, y);
            else
                [motion, SAD] = LogSearch2D(Target, Ref, block_size, p, x, y);
            end
            motionImage(x:x+block_size-1, y:y+block_size-1, :) = motion;
            totalSAD = totalSAD + SAD;
        end
    end
    totalSAD
end

