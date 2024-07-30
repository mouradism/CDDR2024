
hold on
cad=[.35,0.55;-.35,0.55;-.35,-0.55;.35,-0.55;.35,0.55];
plot(cad(:,1),cad(:,2),'LineWidth',1)
ii=size(resff,1);

X=resff(i,:)';
Xo=[0;0.55];

%% 
%........................xa1
La=1.108;
z1=0.622;
z2=0.622;

X1=X+[0;-La/2];%La/2=0.5540
cph2r=(X1(1)^2+X1(2)^2-z1^2-z2^2)/(2*z1*z2);
ph2r=atan2(sqrt(1-cph2r^2),cph2r);%ph2r=-acos(cph2r);
ph1=2*pi+atan2(X1(2)*(z1+z2*cph2r)-X1(1)*z2*sin(ph2r),X1(1)*(z1+z2*cph2r)+X1(2)*z2*sin(ph2r));
ph2=ph2r+ph1;
Xa=+([z1*cos(ph1);z1*sin(ph1)])+Xo;

sm=[Xo,Xa,X]';
cab=[.35,0.55;X';-.35,0.55];

hold on
plot(sm(:,1),sm(:,2),'--ro','LineWidth',2)
plot(cab(:,1),cab(:,2),'--y','LineWidth',0.5)



%plot(resfff(:,1),resfff(:,2),'b','LineWidth',2)
%grid