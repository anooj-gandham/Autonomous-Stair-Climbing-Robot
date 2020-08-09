function t=trlsolve(x,x1,x2,d1,d2)
t=[(x(1)-x1(1))^2+(x(2)-x1(2))^2-d1^2;(x(1)-x2(1))^2+(x(2)-x2(2))^2-d2^2];
end