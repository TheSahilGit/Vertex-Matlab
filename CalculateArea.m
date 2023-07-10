% This function calculates area of a polygon having vertices at [x] and [y]

function [area]=CalculateArea(x,y)
sum1=0.0;
sum2=0.0;
if length(x)~=length(y)
    disp("x,y lenghts are not same");
    return
else
    for i=1:length(x)
        j=i+1;
        if i==length(x)
            j=1;
        end
        sum1= sum1 +  x(i)*y(j);
        sum2 = sum2 + x(j)*y(i);
        area=abs(sum1-sum2)./2.0;
    end
end
end

% area= area+ 0.5 * abs(x(i)*y(j)-x(j)*y(i))
% Why this did not work !!!