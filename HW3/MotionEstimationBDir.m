function [ motionImage ] = MotionEstimationBDir( Target, Ref1, Ref2, block_size, p, method)
    image_size = size(Target);
    motionImage = zeros(image_size(1), image_size(2), image_size(3));
    totalSAD = 0;
    for x = 1:block_size:image_size(1)
        for y = 1:block_size:image_size(2)
            
            if strcmp(method, 'full')
                [motion1, SAD1] = FullSearch(Target, Ref1, block_size, p, x, y);
                [motion2, SAD2] = FullSearch(Target, Ref2, block_size, p, x, y);
            else
                [motion1, SAD1] = LogSearch2D(Target, Ref1, block_size, p, x, y);
                [motion2, SAD2] = LogSearch2D(Target, Ref2, block_size, p, x, y);
            end
            
            if SAD1 <= SAD2
                motionImage(x:x+block_size-1, y:y+block_size-1, :) = motion1;
                totalSAD = totalSAD + SAD1;
            else
                motionImage(x:x+block_size-1, y:y+block_size-1, :) = motion2;
                totalSAD = totalSAD + SAD2;
            end
        end
    end
    disp(totalSAD)
end

