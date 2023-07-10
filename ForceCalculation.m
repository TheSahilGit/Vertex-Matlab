function [fxx,fyy,En,area]=ForceCalculation(L,num,inn,v,pars)% Varibles
% xx and yy are the coordinates of the cell centres.

Ao=pars(1);
eta=pars(2);
lambda=pars(3);
beta=pars(4);
gamma=pars(5);
%Co=2*sqrt(pi*Ao);
Co = 0.0;

%corners=[1 L L*L-L+1 L*L ];
TwinsArray

fxx=zeros(length(v(:,1)),1);
fyy=zeros(length(v(:,2)),1);
fxx_temp=fxx;
fyy_temp=fyy;

for ii=1:length(workingzone)
    i=workingzone(ii); %length(num)%4*L*L+L:L:5*L*L  %1:L*L%length(num)  %L*L %5*L*L+1%length(num)
    %if num(i)~=0
        vx=v(inn(i,1:num(i)),1);
        vy=v(inn(i,1:num(i)),2);
        
        area(i) = abs(polyarea(vx,vy));
        perimeter(i)= CalcualtePerimeter(vx,vy);
        fx1=0.0;
        fy1=0.0;
        fx2=0.0;
        fy2=0.0;
        for j=1:num(i)
            jjp = j+1;
            jjm = j-1;
            if j==num(i)
                jjp = 1;
            elseif j==1
                jjm = num(i);
            end

            djk = CalculateDistance(vx(j),vx(jjm),vy(j),vy(jjm));
            %j,jjm
            
            
            %disp("c2 is the left");
            fx1 = - lambda * (area(i)-Ao)* (vy(jjm)-vy(jjp));
            fx2= - (2*beta)* (perimeter(i)-Co)* (vx(j)-vx(jjp))/djk;
            fx3= - gamma * (vx(j)-vx(jjp))/djk;

            fy1 = - (lambda) * (area(i)-Ao)* (vx(jjp)-vx(jjm)) ;
            fy2= - (2*beta)* (perimeter(i)-Co)*(vy(j)-vy(jjp))/djk;
            fy3= -gamma * (vy(j)-vy(jjp))/djk;


            %disp(fy2)
            
            fx(j) = (fx1+fx2+fx3)/eta + 0.5*(2*rand(1)-1); % x-component of force at the j th vertex.
            fy(j) =  (fy1+fy2+fy3)/eta+ 0.5*(2*rand(1)-1) ;  % y-component of force at the j th vertex.
            
            % Random noise on force at each vertex.
            %disp(djk)
        end
        fxx_temp(inn(i,1:num(i)))=fx(1:num(i));
        fyy_temp(inn(i,1:num(i)))=fy(1:num(i));
        fxx(inn(i,1:num(i)))=fxx(inn(i,1:num(i)))+fxx_temp(inn(i,1:num(i)));
        fyy(inn(i,1:num(i)))=fyy(inn(i,1:num(i)))+fyy_temp(inn(i,1:num(i)));
        
        energy(i)=lambda*(area(i)-Ao)^2 + beta * (perimeter(i)-Co)^2 ...
                    + gamma * perimeter(i);
    %end  
end


mainarea=(1:L*L);
leftpanel=(1:L);
rightpanel=(L*L-L+1:L*L);
toppanel=(L:L:L*L);
bottompanel=(1:L:L*L-L+1);
corners=[1 L L*L-L+1 L*L ];

Boundary=[leftpanel rightpanel toppanel bottompanel corners];

%%- Making the forces at the boundary =0

%fxx(inn(Boundary, 1:num(Boundary))) = 0; 
%fyy(inn(Boundary, 1:num(Boundary))) = 0; 


writematrix(fxx,'fxx.dat','Delimiter',' ');

En=sum(energy(1:L*L));
end