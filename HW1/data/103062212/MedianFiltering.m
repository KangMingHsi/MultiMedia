function [ output ] = MedianFiltering( input, fsize)

    %get the size of input
    [m, n, k] = size(input);
    a = fsize;
    b = fsize;
    
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
               candidate = temp(i-range_a:i+range_a, j-range_b:j+range_b,l);
               
               temp(i,j,l) = median(candidate(:));
               output(i+1-a,j+1-b,l) = temp(i,j,l);
           end
        end
    end
    
    output = cast(output, class(input));
end

