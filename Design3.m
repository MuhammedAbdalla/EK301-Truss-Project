nodes = 11;
C = zeros(nodes,2*nodes-3);
[vertices, members] = size(C);

C(1,1) = 1; C(2,1) = 1;
C(2,2) = 1; C(3,2) = 1;
C(3,3) = 1; C(4,3) = 1;
C(4,4) = 1; C(5,4) = 1;
C(1,5) = 1; C(6,5) = 1;
C(2,6) = 1; C(6,6) = 1;
C(2,7) = 1; C(7,7) = 1;
C(2,8) = 1; C(8,8) = 1;
C(3,9) = 1; C(8,9) = 1;
C(3,10) = 1;C(9,10) = 1;
C(4,11) = 1;C(9,11) = 1;
C(4,12) = 1;C(10,12) = 1;
C(4,13) = 1;C(11,13) = 1;
C(5,14) = 1;C(11,14) = 1;
C(6,15) = 1;C(7,15) = 1;
C(7,16) = 1;C(8,16) = 1;
C(8,17) = 1;C(9,17) = 1;
C(9,18) = 1;C(10,18) = 1;
C(10,19) = 1;C(11,19) = 1;

[vertices, members] = size(C);

X = [0 7.5 15 22 29 1.25 3.75 10.25 18.5 22 25.5]
Y = [0 0 0 0 0 5 7 7 7 7 5]

Sx1 = zeros(vertices,1); Sy1 = zeros(vertices,1); Sy2 = zeros(vertices,1);

SX = [Sx1 Sy1 Sy2]; SY = [Sx1 Sy1 Sy2];

SX(1,1) = 1; SY(1,2) = 1; SY(5,3) = 1;

L = zeros(2*vertices,1);
L(vertices+3) = 64;

deadLoad = 1;
TrussAnalyzer(C,SX,SY,X,Y,L,deadLoad);

