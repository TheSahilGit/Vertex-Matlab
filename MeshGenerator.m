function [v,c,p]=MeshGenerator(L,israndom,isseed,seed)
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
    x = x(:) ;
    y = y(:) ;

    mainarea=(1:L*L);
    leftpanel=(1:L);
    rightpanel=(L*L-L+1:L*L);
    toppanel=(L:L:L*L);
    bottompanel=(1:L:L*L-L+1);
    corners=[1 L L*L-L+1 L*L ];

    leftpanel2=(L+1:2*L);
    rightpanel2=(L*L-2*L+1:L*L-2*L+L);
    toppanel2=(L-1:L:L*L-1);
    bottompanel2=(2:L:L*L-L+2);
    corners2=[1 L L*L-L+1 L*L ];


    leftpanel3=(2*L+1:3*L);
    rightpanel3=(L*L-3*L+1:L*L-3*L+L);
    toppanel3=(L-2:L:L*L-2);
    bottompanel3=(3:L:L*L-L+3);
    % corners2=[1 L L*L-L+1 L*L ];

    Boundary=[leftpanel rightpanel toppanel bottompanel];

    Boundary2 =[Boundary leftpanel2 rightpanel2 toppanel2 bottompanel2];

    Boundary3 =[Boundary2 leftpanel3 rightpanel3 toppanel3 bottompanel3];

    inside2 = setdiff(mainarea,Boundary2);




    %x(inside2') = x(inside2') + 0.5 * (2*ran(inside2')'-1);

    %y(inside2') = y(inside2') + 0.5 * (2*ran(inside2')'-1);



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

%%
% function [v,c,p]=MeshGenerator(L,israndom,isseed,seed)
% m=(1:1:L);
% x=repmat(m,L,1);
% %x=randi(L,L);
% %x=x*sqrt(3)/2;
% y = repmat(m, L, 1)';
% mm = repmat([0 0.5],[L,L/2]);
% y=y+mm;
% y=y(:);
% x=x(:);
%
% if isseed==true
%     rng(seed);
% end
%
% ran=rand(1,length(x));
% if israndom==true
%     x=x(:)+(ran(:)-0.5);
%     y=y(:);%+(ran(:)-0.5);
%
%
% %     for i=2:2:length(x)
% %         x(i)=x(i)+0.5;
% %     end
% %
% %     for i=4:4:length(x)
% %         x(i)=x(i)+0.25;
% %         y(i)=y(i)+0.25;
% %     end
%
%     % y=y(:)+ran(:);
% end
%
%
% % x
% % y
%
%
% xx=[x;x+L;x-L;x;x;x+L;x-L;x+L;x-L];
% yy=[y;y;y;y+L;y-L;y+L;y-L;y-L;y+L];
% %size(xx)
% %[vx,vy]=voronoi(xx,yy);
% p=[xx,yy];
% %size(p)
% [v,c]=voronoin(p);
%
%
%
%
%
% end