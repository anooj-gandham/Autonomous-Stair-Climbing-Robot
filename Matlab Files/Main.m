l1=235;%bogie
l2=450;%rocker
l3=135;%bogie joint
i0=17000;
wheel2=[];
bogiej=[];
wheel3=[];
velec=[];
v1=0.200;
dum1=[];
dum2=[];
dumdiff=[0 0 0 0];
payload=[];
vidObj = VideoWriter('motion.avi');
vidObj.FrameRate=15;  
open(vidObj);
figure('units','pixels','position',[0 0 1920 1080])
plot(path(1,:),path(2,:),'r.-')
hold on
plot(ground0(1,:),ground0(2,:),'b-')
axis([0 8000 0 8000])
chassisj=[];
for i=i0:200:length(path)
    i
    dum0=(path(:,i));
    dum1=whl(path,dum0,l1);
    wheel2=[wheel2,dum1];
    dum2=trl(dum1,dum0,l3);
    bogiej=[bogiej,dum2];
    dum3=whl(path,dum2,l2);
    wheel3=[wheel3,dum3];  
    [thet1,r]=cart2pol(dum2(1)-dum3(1),dum2(2)-dum3(2));
    thet1=thet1-pi/10;
    dum4=dum2+l2g(thet1)*[-202.027;110.32];
    chassisj=[chassisj,dum4];
    dum5=dum4+l2g(thet1)*[175;0];
    payload=[payload,dum5];
    dumpre=[dum0 dum1 dum3 dum5];
    distvec=dumpre-dumdiff;
    dist=sqrt(distvec(1,:).^2+distvec(2,:).^2);
    velec=[velec ; v1 v1*dist(2)/dist(1) v1*dist(3)/dist(1) v1*dist(4)/dist(1)];
    dumdiff=[dum0 dum1 dum3 dum5];
    plot(ground0(1,:),ground0(2,:),'k-')
    hold on
    %plot(chassisj(1,:),chassisj(2,:),'r-.')
    plot(payload(1,:),payload(2,:),'r-')
    axis([0 10000 0 10000])
    line([dum0(1) dum2(1)],[dum0(2) dum2(2)],'Color','b')
    line([dum2(1) dum1(1)],[dum2(2) dum1(2)],'Color','b')
    line([dum2(1) dum4(1)],[dum2(2) dum4(2)],'Color','b')
    line([dum3(1) dum4(1)],[dum3(2) dum4(2)],'Color','b')    
    legend('Ground','Payload COM','Bogie1', 'Bogie2','Rocker1', 'Rocker2')
    viscircles([dum0';dum1';dum3'],[R;R;R],'Color','m')
    currFrame = getframe(gcf);
    writeVideo(vidObj,currFrame);
    clf
end
close(vidObj)
plot(ground0(1,:),ground0(2,:),'g-',payload(1,:),payload(2,:),'c-')
axis([0 8000 0 6000])