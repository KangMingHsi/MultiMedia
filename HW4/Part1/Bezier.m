function [ output ] = Bezier( ctrlPointList, HighQuality)
    [m,n] = size(ctrlPointList);    
    output = [];
    for i = 0:3:m
        output = [output; getEnrichPoint(ctrlPointList(mod(i,m)+1,:),ctrlPointList(mod(i+1,m)+1,:),ctrlPointList(mod(i+2,m)+1,:),ctrlPointList(mod(i+3,m)+1,:),HighQuality)];
    end
end

