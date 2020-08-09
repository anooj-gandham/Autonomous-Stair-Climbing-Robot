for i=pi:0.001:3*pi/2
    dum_x=x'+[d*cos(i);d*sin(i)];
    mag=(path(:,n1-5:n2)-dum_x);
    mag=sqrt(mag.^2);
    mag=mag(1,:)+mag(2,:);
    mag=min(mag);
    if mag<0.1
        break
    end
end
r=dum_x;
syms x y
eqn1=(x1(1)-x)^2+(x1(2)-y)^2==d1^2;
eqn2=(x2(1)-x)^2+(x2(2)-y)^2==d2^2;
S=solve(eqn1,eqn2,x,y);
x_S=double(S.x);
y_S=double(S.y);
point_S=[x_S,y_S]
mid=(x1+x2)/2;
difff=point_S-mid;
if difff(1,1)<=0 && difff(1,2)>=0
    t=point_S(1,:);
end
if difff(2,1)<=0 && difff(2,2)>=0
    t=point_S(2,:);
end

dum2=trl(dum1,dum0,l3);
    bogiej=[bogiej,dum2];  
   \
 viscircles([dum0';dum1'],[R;R])
    pause(0.05)