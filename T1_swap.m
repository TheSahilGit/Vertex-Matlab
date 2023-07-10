function [v,inn,num, T1Count]=T1_swap(L,v,inn,num,min_L, T1Count)

cellno=[];
verno=[];

k=1;
for i=1:L*L
    if num(i)~=0
        vx=v(inn(i,1:num(i)),1);
        vy=v(inn(i,1:num(i)),2);
        for j=1:num(i)
            jjp = j+1;
            jjm = j-1;
            if j==num(i)
                jjp = 1;
            elseif j==1
                jjm = num(i);
            end
            djk = CalculateDistance(vx(j),vx(jjp),vy(j),vy(jjp));
            if djk<min_L
                %disp("dd")
                cellno(k)=i;
                verno(k)=j;
                dVal(k)=djk;
                k=k+1;

                %else

            end
        end
    end
end
% if isempty(cellno)==false
%     [m,indx]=min(dVal);
%     m
%     %d=min_L/m
%     d=1;
%     is=cellno(indx)
%     js=verno(indx)


innStore = inn;
numStore = num;
vStore = v;


mainarea = (1:L*L);
leftpanel = (1:L);
rightpanel = (L*L-L+1:L*L);
toppanel = (L:L:L*L);
bottompanel = (1:L:L*L-L+1);
corners = [1 L L*L-L+1 L*L ];
ghostcorner = [5*L*L+1 7*L*L+L 9*L*L-L+1 7*L*L];
Boundary = [leftpanel rightpanel toppanel bottompanel];


[vn] = Neighbor(inn,num);
%d = 1;



newisR = false;
newisL = false;
newisT = false;
newisB = false;
newisC = false;


if isempty(cellno)==false
    [m,indx]=min(dVal);
    m
    %d=min_L/m;
    d = m/min_L;
    %d=1;
    is=cellno(indx)
    js=verno(indx)


    [nnsU,vxs,vys,jsp,bothedge, jsNew] = NeighborInformation(v,vn,inn,num,is,js);
    %jsp
    [vxsnew,vysnew] = PerpendicularBisector(vxs,vys,d);
    %nnsU
    bou = intersect(nnsU,Boundary);
    numnnsU = num(nnsU);
    %bou
    %bothedge
    %jsNew
    if bou ==0
      [v,inn,num]=DoThatThing(is,js,jsp,vxsnew,vysnew,inn,num,v,nnsU);
      T1Count=T1Count+1;
    end
    
   

    % if intersect(bou,leftpanel)~=0
    %     newisR=is+L*L;
    %     [nnsUR,vxsR,vysR,jspR, bothedge2, jsNew2] = NeighborInformation(v,vn,inn,num,newisR,js);
    %     [vxsnewR,vysnewR] = PerpendicularBisector(vxsR,vysR,d);
    %     %jspR
    % end
    % if intersect(bou,rightpanel)~=0
    %     newisL=is+2*L*L;
    %     [nnsUL,vxsL,vysL,jspL, bothedge2, jsNew2]=NeighborInformation(v,vn,inn,num,newisL,js);
    %     [vxsnewL,vysnewL]=PerpendicularBisector(vxsL,vysL,d);
    %     %jspL
    % end
    % if intersect(bou,bottompanel)~=0
    %     newisT=is+3*L*L;
    %     [nnsUT,vxsT,vysT,jspT] = NeighborInformation(v,vn,inn,num,newisT,js);
    %     [vxsnewT,vysnewT] = PerpendicularBisector(vxsT,vysT,d);
    %     %jspT
    %     nnsUT;
    % end
    % if intersect(bou,toppanel)~=0
    %     newisB=is+4*L*L;
    %     [nnsUB,vxsB,vysB,jspB, bothedge2, jsNew2] = NeighborInformation(v,vn,inn,num,newisB,js);
    %     [vxsnewB,vysnewB] = PerpendicularBisector(vxsB,vysB,d);
    %     %jspB
    % end
    % if intersect(bou,corners)~=0
    %     bouC=intersect(bou,corners);
    %     corIndx=find(bouC==corners);
    %     if corIndx==1
    %         newisC=is+5*L*L;
    %     elseif corIndx==2
    %         newisC=is+7*L*L;
    %     elseif corIndx==3
    %         newisC=is+8*L*L;
    %     elseif corIndx==4
    %         newisC=is+6*L*L;
    %     end
    %     [nnsUC,vxsC,vysC,jspC, bothedge2, jsNew2]=NeighborInformation(v,vn,inn,num,newisC,js);
    %     [vxsnewC,vysnewC]=PerpendicularBisector(vxsC,vysC,d);
    %     %jspC
    % end
    % 
    % 
    % 
    % 
    % 
    % 
    % 
    % if newisR
    %     if jsp~=jspR
    %         disp("DID NOt Match R " )
    %         newisR, jsp, jspR
    % 
    %     end
    % 
    %     [v,inn,num]=DoThatThing(newisR,js,jspR,vxsnewR,vysnewR,inn,num,v,nnsUR);
    % end
    % if newisL
    %     if jsp~=jspL
    %         disp("DID NOt Match L ")
    %         newisL, jsp, jspL
    %     end
    %     [v,inn,num]=DoThatThing(newisL,js,jspL,vxsnewL,vysnewL,inn,num,v,nnsUL);
    % end
    % if newisT
    %     if jsp~=jspT
    %         disp("DID NOt Match T ")
    %         newisT, jsp, jspT
    %     end
    %     [v,inn,num]=DoThatThing(newisT,js,jspT,vxsnewT,vysnewT,inn,num,v,nnsUT);
    % end
    % if newisB
    %     if jsp~=jspB
    %         disp("DID NOt Match B ")
    %         newisB, jsp, jspB
    %     end
    %     [v,inn,num]=DoThatThing(newisB,js,jspB,vxsnewB,vysnewB,inn,num,v,nnsUB);
    % end
    % if newisC
    %     if jsp~=jspC
    %         disp("DID NOt Match C ")
    %         newisC, jsp, jspC
    %     end
    %     [v,inn,num]=DoThatThing(newisC,js,jspC,vxsnewC,vysnewC,inn,num,v,nnsUC);
    % end
    % 
    % %[v,inn,num]=DoThatThing(is,js,jsp,vxsnew,vysnew,inn,num,v,nnsU);
    % 
    % numnnsU = num(nnsU);
    % T1Count=T1Count+1;


    %%-- New Addition
    % if intersect(bou,corners)~=0
    %     [vn] = Neighbor(inn,num);
    %     %is = 1;
    %     jj=1;
    %     for ii = 1:L*L
    %         nn = [];
    %         for j=1:length(vn)
    %             if vn(ii,j)~=0
    %                 nn(jj)=j;
    %                 jj=jj+1;
    %             end
    %         end
    %         nn(nn>L*L) = [];
    %         nn(nn==0) = [];
    %         nni(ii) = length(nn);
    %     end
    %     nnL = nni(nni<2);
    % 
    %     if nnL==true
    %         inn = innStore;
    %         num = numStore;
    %         v = vStore;
    %     end
    % end

    % [vnNew] = Neighbor(inn,num);
    % jj=1;
    % for i=1:L*L
    %     for j=1:length(vn)
    %         if vn(i,j)~=0
    %             nn(jj)=j;
    %             jj=jj+1;
    %         end
    %     end
    %     nn(nn>L*L)=[];
    %     nn
    %     if length(nn)<2
    %         inn = innStore;
    %         num = numStore;
    %         v = vStore;
    %     end
    % end



end

end

% This function changes the value in v, and does the T1 Core

function [v,inn,num]=DoThatThing(is,js,jsp,vxsnew,vysnew,inn,num,v,nnsU)
pp=inn(is,js);
ppn=inn(is,jsp);

%js,jsp

v(inn(is,js),1)=vxsnew(2);
v(inn(is,jsp),1)=vxsnew(1);
v(inn(is,js),2)=vysnew(2);
v(inn(is,jsp),2)=vysnew(1);

[inn,num]=T1Core(pp,ppn,nnsU,inn,num);
end

