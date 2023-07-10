figure;
subplot(1,2,1)
for i=1:L*L
    vaax=vInitial(innInitial(i,1:numInitial(i)),1);
    vaay=vInitial(innInitial(i,1:numInitial(i)),2);
    %vaax=[vaax;vaax(1)];
    %vaay=[vaay;vaay(1)];
    p = polyshape(vaax, vaay);
    plot(p,'FaceColor','red','FaceAlpha',0.1, LineWidth=1.5)
    hold on;
end
title("t=1")
axis square

subplot(1,2,2)
for i=1:L*L %length(num)
    vx=v(inn(i,1:num(i)),1);
    vy=v(inn(i,1:num(i)),2);
    %vx=[vx;vx(1)];
    %vy=[vy;vy(1)];
    p = polyshape(vx, vy);
    plot(p,'FaceColor','blue','FaceAlpha',0.1, LineWidth=1.5)
    hold on;
end
title(strcat(["t=",num2str(dt*totTime)]))
axis square
%--

figure()
time = (0:dt:totTime*dt-dt);
plot(time,energy, LineWidth=1.5)
axis square;
title("En-T")
xlabel("time")
ylabel("Energy")
set(gca, fontsize=16, fontname= "Times", fontweight="Bold")

