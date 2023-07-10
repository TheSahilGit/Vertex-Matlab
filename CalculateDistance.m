function [d]=CalculateDistance(x1,x2,y1,y2)
%d=sqrt((x1-x2)^2+(y1-y2)^2);
X = [x1 x2];
Y = [y1 y2];
d = norm(X-Y);
end
