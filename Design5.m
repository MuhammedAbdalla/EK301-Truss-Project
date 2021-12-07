nodes = 7;
C = zeros(nodes,2*nodes-3);
[vertices, members] = size(C);

C(1,1) = 1; C(2,1) = 1;
C(2,2) = 1; C(3,2) = 1;
C(1,3) = 1; C(4,3) = 1;
C(2,4) = 1; C(4,4) = 1;
C(2,5) = 1; C(5,5) = 1;
C(2,6) = 1; C(6,6) = 1;
C(2,7) = 1; C(7,7) = 1;
C(3,8) = 1; C(7,8) = 1;
C(4,9) = 1; C(5,9) = 1;
C(5,10) = 1;C(6,10) = 1;
C(6,11) = 1;C(7,11) = 1;

[vertices, members] = size(C);

X = [0 15 29 6 12 18 24];
Y = [0 0 0 5.5 6 6 5.5];

Sx1 = zeros(vertices,1); Sy1 = zeros(vertices,1); Sy2 = zeros(vertices,1);

SX = [Sx1 Sy1 Sy2]; SY = [Sx1 Sy1 Sy2];

SX(1,1) = 1; SY(1,2) = 1; SY(3,3) = 1;

L = zeros(2*vertices,1);
L(vertices+2) = 48;

deadLoad = 1;
TrussAnalyzer(C,SX,SY,X,Y,L,deadLoad);

Sx = SX;
Sy = SY;
%save('TrussDesign1_MuhammedMahaJohnson_A5.mat','C','Sx','Sy','X','Y','L')