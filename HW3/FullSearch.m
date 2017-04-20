function [ DMD ] = FullSearch( Target, Ref, p, x, y, method)

    image_size = size(Target);
    SAD_record = realmax;
    chosen_record = [0 0];
    
    for i = 0:p-1
        for j = 0:p-1
            [target_limit, ref_Llimit, ref_Rlimit] = GetBoundary(image_size, p, x, y, i, j, method, p);
            
            T = Target(x:target_limit(1), y:target_limit(2));
            R = Ref(ref_Llimit(1):ref_Rlimit(1), ref_Llimit(2):ref_Rlimit(2));
            
            SAD = sum(sum(abs(T-R)));
            
            if(SAD < SAD_record)
                chosen_record = [i j];
                SAD_record = SAD;
            end
        end
    end
    
    DMD = chosen_record;

end

