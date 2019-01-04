[X,Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
C = del2(Z);
subplot(2,2,1)
mesh(X,Y,Z,C,'FaceLighting','gouraud','LineWidth',0.3);
subplot(2,2,2)
surf(X,Y,Z);
subplot(2,2,3)
meshc(X,Y,Z);colorbar;
subplot(2,2,4)
surfc(X,Y,Z);colorbar;