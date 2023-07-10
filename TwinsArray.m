%clear; clc; close all;
%L=2;

mainarea=(1:L*L);
leftpanel=(1:L);
rightpanel=(L*L-L+1:L*L);
toppanel=(L:L:L*L);
bottompanel=(1:L:L*L-L+1);
corners=[1 L L*L-L+1 L*L ];

Boundary=[leftpanel rightpanel toppanel bottompanel];


leftpanel2=(L+1:2*L);
rightpanel2=(L*L-2*L+1:L*L-2*L);
toppanel2=(L-1:L:L*L-1);
bottompanel2=(2:L:L*L-L+2);
corners2=[1 L L*L-L+1 L*L ];


ghostright=(L*L+1:L*L+L);
ghostleft=(3*L*L-L+1:3*L*L);
ghosttop=(3*L*L+1:L:4*L*L-L+1);
ghostbottom=(4*L*L+L:L:5*L*L);
ghostcorner=[5*L*L+1 7*L*L+L 9*L*L-L+1 7*L*L];
 
ghostBoundary=[ghostright ghostleft ghosttop ghostbottom ghostcorner ];

workingzone=[mainarea ghostleft ghostright ghosttop ghostbottom ghostcorner];
 
ghostright2=(L*L+L+1:L*L+2*L);
ghostleft2=(3*L*L-2*L+1:3*L*L-L);
ghosttop2=(3*L*L+2:L:4*L*L-L+2);
ghostbottom2=(4*L*L+L-1:L:5*L*L-1);
ghostcorner2=[5*L*L+1 7*L*L+L 9*L*L-L+1 7*L*L];

