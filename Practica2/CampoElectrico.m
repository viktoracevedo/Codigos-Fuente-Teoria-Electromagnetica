clc;clear all;close all;
figure(1)
% figura cilindrica
[xx, yy, zz]=cylinder([0.5,0.5]);
% longitud en z
surf(xx, yy, zz.*10);
shading interp
hold on
% superficies normales
[u1, v1, w1]=surfnorm(xx,yy,zz.*10);
hold on
%vectores normales a la superficies
for z = (0:1:10)
zz=z+0.*xx
quiver3(xx,yy,zz,u1,v1,w1,'b')
hold on
end
title('Caompo electrico estatico de un conductor cilindrico', 'fontsize',15)
xlabel('x', 'fontsize',15)
view(-40,32)