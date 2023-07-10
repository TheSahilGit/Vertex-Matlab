tic;
clear;clc;close all;


L = 16;
Ao = 1.0;
eta = 1.0;
lambda = 1.0;

%%--- For Soft tissue------
beta = 0.14;
gamma =  -1.15;
%%-------------------------

%%---- For Hard tissue-----
%beta = 0.14;
%gamma =  -0.5;
%%-------------------------



pars = [Ao eta lambda beta gamma];
min_L = 0.2;

dt = 1.0e-3;
totTime = 10000;



israndom = true;
%israndom = false;
isseed=true;
%isseed = false;


seed = 12; % Change this if you want a different random structure.

[v,c,p] = MeshGenerator_old(L,israndom,isseed,seed);


%
[inn,num] = StoreData(L,v,c);

innInitial = inn;
numInitial = num;
vInitial = v;


%energy = zeros(totTime,1);
%area = zeros(totTime,length(num));

%TwinsArray


tt = 1;
tt1 = 1;
T1Count=0;

for t = 1:totTime
    [fxx,fyy,energy(tt),area(tt,:)] = ForceCalculation(L,num,inn,v,pars);
    %[fxx,fyy] = ForcePeriodic(L,fxx,fyy,num,inn);
    v(:,1) = v(:,1) + dt*fxx(:);
    v(:,2) = v(:,2) + dt*fyy(:);
    tt = tt+1
end
% vrr = VideoWriter('fig3.avi');
% open(vrr)
% writeVideo(vrr,fg)
% close(vrr)

%% Area Mean
meanarea = mean(area(end,1:L*L));
vararea = var(area(end,1:L*L));

%% Plotting

Plotspatial
%SpatialWholePlot
%EnergyPlot
%AreaPlot


toc;