for i=L*L+1:L*L+L
    coord= v(inn(i,1:num(i)),:);
    coord = [coord;coord(1,:)];
    plot(coord(:,1),coord(:,2),Color='r', LineWidth=1.5);
    hold on;
end

for i=4*L*L+L:L:5*L*L
    hold on;
    coord= v(inn(i,1:num(i)),:);
    coord = [coord;coord(1,:)];
    plot(coord(:,1),coord(:,2),Color='green', LineWidth=1.5);
    hold on;
end

for i=3*L*L-L+1:3*L*L
    hold on;
    coord= v(inn(i,1:num(i)),:);
    coord = [coord;coord(1,:)];
    plot(coord(:,1),coord(:,2),Color='blue', LineWidth=1.5);
    hold on;
end
%
%
for i=3*L*L+1:L:4*L*L
    hold on;
    coord= v(inn(i,1:num(i)),:);
    coord = [coord;coord(1,:)];
    plot(coord(:,1),coord(:,2),Color='magenta', LineWidth=1.5);
    hold on;
end
%

for i=5*L*L+1
    hold on;
    coord= v(inn(i,1:num(i)),:);
    coord = [coord;coord(1,:)];
    plot(coord(:,1),coord(:,2),Color='c', LineWidth=1.5);
    hold on;
end

for i=7*L*L
    hold on;
    coord= v(inn(i,1:num(i)),:);
    coord = [coord;coord(1,:)];
    plot(coord(:,1),coord(:,2),Color='c', LineWidth=1.5);
    hold on;
end


for i=7*L*L+L
    hold on;
    coord= v(inn(i,1:num(i)),:);
    coord = [coord;coord(1,:)];
    plot(coord(:,1),coord(:,2),Color='c', LineWidth=1.5);
    hold on;
end

for i=9*L*L-L+1
    hold on;
   coord= v(inn(i,1:num(i)),:);
    coord = [coord;coord(1,:)];
    plot(coord(:,1),coord(:,2),Color='c', LineWidth=1.5);
    hold on;
end





for i=1:L*L
    hold on;
    coord= v(inn(i,1:num(i)),:);
    coord = [coord;coord(1,:)];
    plot(coord(:,1),coord(:,2), '-o',Markerfacecolor='black', Markeredgecolor='black', Color='black', LineWidth=1.5);
    %scatter(coord(:,1),coord(:,2), "blue","filled");
    hold on;
end

%
% for i=1:L
%     hold on;
%     coord= v(inn(i,1:num(i)),:);
%     coord = [coord;coord(1,:)];
%     plot(coord(:,1),coord(:,2),Color='red', LineWidth=1.5);
%     hold on;
%     %fxx(inn(i,1:num(i)))
% end
%



axis square;