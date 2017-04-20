function [ output ] = DCT( input, N, keep_size )
  
    f = double(input);

    %get image size
    [m, n, k] = size(f);
  
    %initial output
    output = zeros(m, n, k);
    
    row_block_num = m / N;
    col_block_num = n / N;

    T = GetDCTMatrix(N);
    
    mask = zeros(N);
    mask(1:keep_size, 1:keep_size) = 1;
    
    for l = 1:k
        for i = 1:row_block_num
           for j = 1:col_block_num
               M = f(N*(i-1)+1:N*i, N*(j-1)+1:N*j, l);
               
               output(N*(i-1)+1:N*i, N*(j-1)+1:N*j, l) = (T * M * T') .* mask;
               
           end
        end
    end
    
    %output = im2uint8(output);
    
end

