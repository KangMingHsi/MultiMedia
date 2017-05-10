function [ DMD,  SAD_record] = LogSearch2D( Target, Ref, block_size, p, x, y)
    
    image_size = size(Target);
    DMD = zeros(block_size, block_size,image_size(3));
    len = floor(log2(p));
    n = max(2, 2 ^ (len-1));
    v = 0; w = 0;
   
    T = Target(x:x+block_size-1, y:y+block_size-1,:);
    while true

        M = {[0 0], [n 0], [0 n], [-n 0], [0 -n]};

        while true
            chosen_record = 1;
            SAD_record = realmax;

            for chosen = 1 : length(M)
                i = M{chosen}(1);
                j = M{chosen}(2);

                if(x+v+i > 0 && x+v+i <= image_size(1)+1-block_size && y+w+j > 0 && y+w+j <= image_size(2)+1-block_size)
                    R = Ref(x+v+i:x+v+i+block_size-1, y+w+j:y+w+j+block_size-1,:);
                    SAD = sum(sum(sum(abs(T-R))));

                    if(SAD < SAD_record)
                        chosen_record = chosen;
                        SAD_record = SAD;
                    end
                end
            end

            if chosen_record == 1
                break;
            end

            i = M{chosen_record}(1);
            j = M{chosen_record}(2);
            v = v + i; w = w + j;
        end

        n = n / 2;
        if n == 1
           break; 
        end

    end

    SAD_record = realmax;
    chosen_record = [0 0];

    for i = -1:1
       for j = -1:1
            if(x+v+i > 0 && x+v+i <= image_size(1)+1-block_size && y+w+j > 0 && y+w+j <= image_size(2)+1-block_size)
                R = Ref(x+v+i:x+v+i+block_size-1, y+w+j:y+w+j+block_size-1,:);
                SAD = sum(sum(sum(abs(T-R))));

                if(SAD < SAD_record)
                    chosen_record = [i j];
                    SAD_record = SAD;
                end
            end
       end
    end

    v = v + chosen_record(1); w = w + chosen_record(2);
    DMD = Ref(x+v:x+v+block_size-1, y+w:y+w+block_size-1,:);

end

