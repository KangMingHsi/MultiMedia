function [ DMD ] = LogSearch2D( Target, Ref, p, x, y, method)
    
    image_size = size(Target);
    
    len = floor(log2(p));
    n = max(2, 2 ^ (len-1));
    v = 0; w = 0;
    
    while true
       
        M = {[0 0], [n 0], [0 n], [-n 0], [0 -n]};
        M_tmp = M;
    
        while true
            chosen_record = 0;
            SAD_record = realmax;
            
            for chosen = 1 : length(M_tmp)
                i = M_tmp{chosen}(1);
                j = M_tmp{chosen}(2);
                
                if (abs(i+v) > p) || (abs(j+w) > p)
                    continue;
                end
                
                [target_limit, ref_Llimit, ref_Rlimit] = GetBoundary(image_size, n, x, y, i+v, j+w, method, p);
                
                if(ref_Llimit(1) < 1 || ref_Llimit(2) < 1) || (ref_Llimit(1) > image_size(1) || ref_Llimit(2) > image_size(2))
                    continue;
                end
                
                T = Target(x:target_limit(1), y:target_limit(2));
                R = Ref(ref_Llimit(1):ref_Rlimit(1), ref_Llimit(2):ref_Rlimit(2));
               
                SAD = sum(sum(abs(T-R)));
                
                if(SAD < SAD_record)
                    chosen_record = chosen;
                    SAD_record = SAD;
                end
            end
            
            if chosen_record == 1
                break;
            end

            i = M_tmp{chosen_record}(1);
            j = M_tmp{chosen_record}(2);
            v = v + i; w = w + j;
            %M_tmp = {[i j], [n+i j], [i n+j], [-n+i j], [i j-n]};
        end
        
        n = n / 2;
        if n == 1
           break; 
        end

    end
    
    % TODO eight neighbor SAD and choose the mini value index 
    SAD_record = realmax;
    chosen_record = [0 0];
    
    for i = -1:1
       for j = -1:1
           
            if ((x+i+v) > (x+p)) || ((y+j+w) > (y+p)) || ((y+j+w) < (y-p)) || ((x+i+v) < (x-p))
                continue;
            end
           
            [target_limit, ref_Llimit, ref_Rlimit] = GetBoundary(image_size, n, x, y, i+v, j+w);
            
            if(ref_Llimit(1) < 1 || ref_Llimit(2) < 1 || ref_Llimit(1) > image_size(1) || ref_Llimit(2) > image_size(2))
                continue;
            end
            
            T = Target(x:target_limit(1), y:target_limit(2));
            R = Ref(ref_Llimit(1):ref_Rlimit(1), ref_Llimit(2):ref_Rlimit(2));

            SAD = sum(sum(abs(T-R)));
                
            if(SAD < SAD_record)
                chosen_record = [i j];
                SAD_record = SAD;
            end
       end
    end
    
    v = v + chosen_record(1); w = w + chosen_record(2);
    DMD = [v w];
end

