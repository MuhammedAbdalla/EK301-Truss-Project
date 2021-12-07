c1 = [1 0 1 0 0 0 0 0 0];
c2 = [1 1 0 1 1 0 0 0 0];
c3 = [0 1 0 0 0 1 0 0 0];
c4 = [0 0 1 1 0 0 1 1 0];
c5 = [0 0 0 0 1 1 1 0 1];
c6 = [0 0 0 0 0 0 0 1 1];

C = [c1;c2;c3;c4;c5;c6];
[vertices, members] = size(C);

X = [0 15 29 6 24 15];
Y = [0 0 0 8 7 15];

Sx1 = zeros(vertices,1); Sy1 = zeros(vertices,1); Sy2 = zeros(vertices,1);

SX = [Sx1 Sy1 Sy2]; SY = [Sx1 Sy1 Sy2];

SX(1,1) = 1; SY(1,2) = 1; SY(3,3) = 1;

L = zeros(2*vertices,1);
L(vertices+2) = 32;

deadLoad = 1;
TrussAnalyzer(C,SX,SY,X,Y,L,deadLoad);

Sx = SX;
Sy = SY;
save('TrussDesign1_MuhammedMahaJohnson_A5.mat','C','Sx','Sy','X','Y','L')