nodes = 10;
C = zeros(nodes,2*nodes-3);
[vertices, members] = size(C);

C(1,1) = 1; C(2,1) = 1;
C(2,2) = 1; C(3,2) = 1;
C(3,3) = 1; C(4,3) = 1;
C(4,4) = 1; C(5,4) = 1;

C(1,5) = 1; C(6,5) = 1;
C(2,6) = 1; C(6,6) = 1;

C(2,7) = 1; C(7,7) = 1;
C(3,8) = 1; C(7,8) = 1;
C(3,9) = 1; C(8,9) = 1;
C(3,10) = 1;C(9,10) = 1;
C(4,11) = 1;C(9,11) = 1;
C(4,12) = 1;C(10,12) = 1;
C(5,13) = 1;C(10,13) = 1;
C(6,14) = 1;C(7,14) = 1;
C(7,15) = 1;C(8,15) = 1;
C(8,16) = 1;C(9,16) = 1;
C(9,17) = 1;C(10,17) = 1;

X = [0 7 15 22 29 0 7 15 22 29];
Y = [0 0 0 0 0 6 10 13 10 6];

Sx1 = zeros(vertices,1); Sy1 = zeros(vertices,1); Sy2 = zeros(vertices,1);

SX = [Sx1 Sy1 Sy2]; SY = [Sx1 Sy1 Sy2];

SX(1,1) = 1; SY(1,2) = 1; SY(5,3) = 1;

L = zeros(2*vertices,1);
L(vertices+3) = 32;

deadLoad = 1;
TrussAnalyzer(C,SX,SY,X,Y,L,deadLoad);

