function [v,c,p]=MeshGenerator_old(L,israndom,isseed,seed)
m=(1:1:L);
x=repmat(m,L,1);
%x=randi(L,L);
%x=x*sqrt(3)/2;
y = repmat(m, L, 1)';
mm = repmat([0 0.5],[L,L/2]);
y=y+mm;
y=y(:);
x=x(:);

if isseed==true
    rng(seed);
end

ran=rand(1,length(x));
if israndom==true
    x=x(:)+(ran(:)-0.5);
    y=y(:);%+(ran(:)-0.5);


%     for i=2:2:length(x)
%         x(i)=x(i)+0.5;
%     end
% 
%     for i=4:4:length(x)
%         x(i)=x(i)+0.25;
%         y(i)=y(i)+0.25;
%     end

    % y=y(:)+ran(:);
end


% x
% y


xx=[x;x+L;x-L;x;x;x+L;x-L;x+L;x-L];
yy=[y;y;y;y+L;y-L;y+L;y-L;y-L;y+L];
%size(xx)
%[vx,vy]=voronoi(xx,yy);
p=[xx,yy];
%size(p)
[v,c]=voronoin(p);





end