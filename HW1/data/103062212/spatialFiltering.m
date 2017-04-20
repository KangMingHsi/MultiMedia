function output = spatialFiltering(input, mask)
    
    %get the size of input and mask
    [m, n, k] = size(input);
    [a, b] = size(mask);
    
    %get the size that might out of index
    range_a = floor(a/2);
    range_b = floor(b/2);
    
    %pad with 0 
    %initial
    temp = zeros(m+2*(a-1), n+2 * (b-1), k);
    temp(a:m+a-1, b:n+b-1, :) = double(input);
    output = zeros(m,n,k);
    
    
    %for rgb
    for l = 1:k
        %go through each element to calculate mask
        for i = a:m+a-1
           for j = b:n+b-1
               tmp = sum(sum(mask .* temp(i-range_a:i+range_a, j-range_b:j+range_b,l)));
               output(i+1-a,j+1-b,l) = tmp;
           end
        end
    end
    
    output = cast(output, class(input));
%     %ignore
%     temp = double(input);
%     a_mid = round(a/2);
%     b_mid = round(b/2);
%     for i = 1:m
%         
%         x1 = i-range_a;
%         x2 = i+range_a;
%        
%         x1(x1 < 1) = 1;
%         x2(x2 > m) = m;
%         
%         a1 = i-x1;
%         a2 = x2-i;
%         
%         for j = 1:n
%             y1 = j-range_b;
%             y2 = j+range_b;
%             
%             y1(y1 < 1) = 1;
%             y2(y2 > n) = n;
%             
%             b1 = j-y1;
%             b2 = y2-j;
%             output(i,j) = sum(sum(temp(x1:x2, y1:y2) .* mask(a_mid-a1:a_mid+a2, b_mid-b1:b_mid+b2)));
%         end
%     end
%     imshow(output);
%     %mirror
end