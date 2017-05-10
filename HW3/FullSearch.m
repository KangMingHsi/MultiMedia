function [ DMD, SAD_record] = FullSearch( Target, Ref, block_size, p, x, y)

    image_size = size(Target);
    
    chosen_record = [0 0];
    %DMD = zeros(block_size, block_size, image_size(3));
    
    SAD_record = realmax;
    
    T = Target(x:x+block_size-1, y:y+block_size-1,:);

    for i = 1-p:p-1
        for j = 1-p:p-1
            if (x+i > 0 && x+i <= image_size(1)+1-block_size && y+j > 0 && y+j <= image_size(2)+1-block_size)                   
                R = Ref( x+i:x+i+block_size-1, y+j:y+j+block_size-1,:);
                SAD = sum(sum(sum(abs(T-R))));

                if(SAD < SAD_record)
                    chosen_record = [x+i y+j];
                    SAD_record = SAD;
                end
            end 
        end
    end
    DMD = Ref(chosen_record(1):chosen_record(1)+block_size-1, chosen_record(2):chosen_record(2)+block_size-1, :);

end

