function [ output ] = YIQ2RGB( input )

    [m n k] = size(input);
    output = zeros(m,n,k);
    
    if k ~= 3
        print('wrong input');
        return;
    end
    
    f = double(input);
    
    transMatrix = [0.299, 0.587, 0.114; 0.596, -0.274, -0.322; 0.211, -0.523, 0.312];
    transMatrix = inv(transMatrix);
    
    for i = 1:m
        for j = 1:n
            
            tmp = zeros(3,1);
            for l = 1:k
               tmp(l) = f(i,j,l);
            end
            
            out = (transMatrix * tmp);
            
            for l = 1:k
               output(i,j,l) = out(l); 
            end
             
        end
    end
    
    output = uint8(output);
end

