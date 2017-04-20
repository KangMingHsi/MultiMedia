function [ motionImage ] = MotionEstimation( Target, Ref, block_size, p, method)
    
    image_size = size(Target);
    motionImage = zeros(image_size(1), image_size(2), 2);
    
    for x = 1:block_size:image_size(1)
        for y = 1:block_size:image_size(2)
            
            if strcmp(method, 'full')
                motion = FullSearch(Target, Ref, p, x, y, method);
            else
                motion = LogSearch2D(Target, Ref, p, x, y, method);
            end
            motionImage(x, y, :) = motion;
        end
    end
end

