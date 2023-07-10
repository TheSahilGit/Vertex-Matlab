function [per]=CalcualtePerimeter(x,y)
per=0.0;
for i=1:length(x)
    j=i+1;
    if i==length(x)
        j=1;
    end
    d=(x(i)-x(j))^2+(y(i)-y(j))^2;
    dis=sqrt(d);
    per=per+dis;
end
end
