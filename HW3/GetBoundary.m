function [ target_limit, ref_Llimit, ref_Rlimit ] = GetBoundary( image_size, n, x, y, i, j, method, p)
    target_limit = zeros(1,2);
    ref_Llimit = zeros(1,2);
    ref_Rlimit = zeros(1,2);

    target_limit(1) = min(image_size(1), x+n);
    target_limit(2) = min(image_size(2), y+n);

    ref_boundary = [target_limit(1)-x+1, target_limit(2)-y+1];
    
    ref_Llimit(1) = max(0, x+i);
    ref_Llimit(2) = max(0, y+j);
    
    ref_Rlimit(1) = min(min(x+i+ref_boundary(1), x+i+n), image_size(1));
    ref_Rlimit(2) = min(min(y+j+ref_boundary(2), y+j+n), image_size(2));

    target_boundary = ref_Rlimit - ref_Llimit + 1;
    
    target_limit(1) = min(target_limit(1), x+target_boundary(1));
    target_limit(2) = min(target_limit(2), y+target_boundary(2));
    
    
end

