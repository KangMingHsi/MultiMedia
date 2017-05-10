function [output] = getEnrichPoint(p0, p1, p2, p3, HighQuality)
if(HighQuality==0)
    t = 0:0.2:1;
else
    t = 0:0.01:1;
end

output = zeros(length(t),2);

output(:,1) = ((1-t).^3)*p0(1) + 3*t.*(1-t).^2*p1(1) + 3*(t.^2).*(1-t)*p2(1) + t.^3*p3(1);
output(:,2) = ((1-t).^3)*p0(2) + 3*t.*(1-t).^2*p1(2) + 3*(t.^2).*(1-t)*p2(2) + t.^3*p3(2);