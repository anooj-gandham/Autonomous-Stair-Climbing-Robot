function t=path_aug(x1,x2)
t=x1;
endpoint=x1(:,end);
x2_trans=x2+endpoint;
t=[x1,x2_trans(:,2:end)];
end