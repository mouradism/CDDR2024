%Draw some useful graphs

%%

%%
resfff = path;
%........................................................
hold off
plot(resfff(:,1),resfff(:,2),'b','LineWidth',4)
legend('Desired  path')
grid

ylabel('Y Axis  ');
xlabel('X Axis  ')
title('Figure :the free collisions path')
%........................................................

hold on
%plot(res(:,1),res(:,2),'mo','MarkerEdgeColor','g')
%........................................................

sizsin=size(sing);
if(sizsin(1)>0)
   plot(sing(:,1),sing(:,2),'dr','MarkerEdgeColor','r')
   
end
%........................................................
hold on
cad =[.35,0.55;-.35,0.55;-.35,-0.55;.35,-0.55;.35,0.55];
cad2=[-.5,0.8;-.5,-0.8;.5,-0.8];
plot(cad(:,1),cad(:,2),'black ','LineWidth',2)
plot(cad2(:,1),cad2(:,2),'black ','LineWidth',1)

plot(resff(:,1),resff(:,2),'y','LineWidth',4)

plot(resfff(:,1),resfff(:,2),'b','LineWidth',2)

%%


hold on
plot(values(1,:),values(2,:),'red','linew',2);
%legend({'Control Polygon' 'Quadratic Spline Curve'},  'location','SE');
plot(values1(1,:),values1(2,:),'g','linew',1.5);

axis equal


%%


%plot(resfff(:,1),resfff(:,2),'b','LineWidth',2)
%grid
hold on
%plot(XC(1,:),XC(2,:),'--ro','LineWidth',2)
%%

