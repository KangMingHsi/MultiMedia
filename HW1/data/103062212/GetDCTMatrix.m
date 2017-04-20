function [ T ] = GetDCTMatrix( N )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    [y x] = meshgrid(0:N-1, 0:N-1);
    
    % DCT matrix
    % Tij = {1/sqrt(N) if i = 1}
    %     = {sqrt(2/N) * cos((2*j+1)*i*pi/ 2 / N) if i > 1}
    
    T = sqrt(2/N) * cos((2*y+1).*x*pi/2/ N);
    T(1,:) = 1/sqrt(N);
end

