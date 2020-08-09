t=300;
r=175;
R=150/2;
OO=[0,R];
span=900;
linspace(0,r-R,1125);
path0=[linspace(0,2*span,18000);R*ones(1,18000)];
path1=[zeros(1,length(linspace(0,r-R,1125)));linspace(0,r-R,1125)];
ang=flip(linspace(pi/2,pi,150));
path2=[R*cos(ang);R*sin(ang)]+[150/2;0];
path3=[linspace(0,t-R,2000);zeros(1,length(linspace(0,t-R,2000)))];
path4=[linspace(0,2*span,18000);0*ones(1,18000)];
path=path0;
stair1=path_aug(path1,path2);
stairf=path_aug(stair1,path3);
for i=1:15
    path=path_aug(path,stairf);
end
path=path_aug(path,path4);
figure
plot(path(1,:),path(2,:),'r--')
axis([0 8000 0 6000])
hold on
%%
ground0=[linspace(0,2*span+R,18000);0*ones(1,18000)];
ground1=[zeros(1,length(linspace(0,r,1750)));linspace(0,r,1750)];
ground2=[linspace(0,t,2700);zeros(1,length(linspace(0,t,2700)))];
ground3=[linspace(0,2*span,18000);0*ones(1,18000)];
acgr1=path_aug(ground1,ground2);
for i=1:15
    ground0=path_aug(ground0,acgr1);
end
ground0=path_aug(ground0,ground3);
plot(ground0(1,:),ground0(2,:),'b-')
axis([0 8000 0 6000])
