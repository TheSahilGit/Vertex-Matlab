function [inn,num]=StoreData(L,v,c)

for i=1:9*L*L
    cellCoord=c{i};
    for j=1:length(cellCoord)
        inn(i,j)=cellCoord(j);
        num(i)=length(cellCoord);
    end
end
%%
% for i=L*L+1:L*L+L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=4*L*L+L:L:5*L*L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=3*L*L-L+1:3*L*L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% % 
% for i=3*L*L+1:L:4*L*L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% for i=5*L*L+1
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=7*L*L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% for i=7*L*L+L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% % 
% for i=9*L*L-L+1
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
 %% Outside layer of the first ghost layer.
% 
% for i=L*L+L+1:L*L+2*L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=3*L*L-2*L:3*L*L-L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% 
% for i=4*L*L+L-1:L:5*L*L-1
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% 
% for i=3*L*L+2:L:4*L*L-L+2
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=5*L*L+2
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=5*L*L+L+1:5*L*L+L+2
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=7*L*L-1
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% for i=7*L*L-L-1:7*L*L-L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=7*L*L+L-1
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% for i=7*L*L+2*L-1:7*L*L+2*L
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=9*L*L-L+2
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end
% 
% for i=9*L*L-2*L+1:9*L*L-2*L+2
%     cellCoord=c{i};
%     for j=1:length(cellCoord)
%         inn(i,j)=cellCoord(j);
%         num(i)=length(cellCoord);
%     end
% end



%% Restructuring

for i=1:length(num)
    if num(i)~=0
        a=v(inn(i,1:num(i)),1);
        k=find(a==min(a));
        kk=floor(k(1));
        inn(i,1:num(i))=circshift(inn(i,1:num(i)),length(inn(i,1:num(i)))-kk+1);
    end

end

for i=1:length(num)
   if num(i)~=0
      a=v(inn(i,1:num(i)),1);
      if a(2)>a(num(i))
          %disp("yup")
          inn(i,1:num(i))=flip(inn(i,1:num(i)));
          inn(i,1:num(i))=circshift(inn(i,1:num(i)),length(inn(i,1:num(i)))+1);
      end
   end

end

for i=1:length(num)
    if num(i)~=0
        vx=v(inn(i,1:num(i)),1);
        vy=v(inn(i,1:num(i)),2);
        [orient,area]=polyorient(vx,vy);
        if orient
             inn(i,2:num(i))=flip(inn(i,2:num(i)));
             %inn(i,1:num(i))=circshift(inn(i,1:num(i)),length(inn(i,1:num(i)))+1);

        end
    end
end


% for i=1:length(num)
%     if num(i)~=0
%         vx=v(inn(i,1:num(i)),1);
%         vy=v(inn(i,1:num(i)),2);
%         [orient,area1]=polyorient(vx,vy);
%         
%     end
% end




end