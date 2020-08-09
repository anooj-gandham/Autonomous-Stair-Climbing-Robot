function t=trl(x1,x2,d)
%x2 should be highest wheel
mid=(x1+x2)/2;
dum0=x2-x1;
dum1=[0 -1;1 0]*dum0/(sqrt(dum0(1)^2+dum0(2)^2));
t=mid+d*dum1;
end

