nodes = 8;
C = zeros(nodes,2*nodes-3);
[vertices, members] = size(C);
C(1,1) = 1; C(2,1) = 1;
C(2,2) = 1; C(3,2) = 1;
C(3,3) = 1; C(4,3) = 1;
C(4,4) = 1; C(5,4) = 1;

C(1,5) = 1; C(6,5) = 1;
C(2,6) = 1; C(6,6) = 1;
C(3,7) = 1; C(6,7) = 1;
C(3,8) = 1; C(7,8) = 1;
C(3,9) = 1; C(8,9) = 1;
C(4,10) = 1;C(8,10) = 1;
C(5,11) = 1;C(8,11) = 1;
C(6,12) = 1;C(7,12) = 1;
C(7,13) = 1;C(8,13) = 1;


Sx1 = zeros(vertices,1); Sy1 = zeros(vertices,1); Sy2 = zeros(vertices,1);

SX = [Sx1 Sy1 Sy2]; SY = [Sx1 Sy1 Sy2];

SX(1,1) = 1; SY(1,2) = 1; SY(5,3) = 1;

L = zeros(2*vertices,1);
L(vertices+3) = 36;


X= [0,6.5,15,23,29,6.5,15,23];

Y= [0,0,0,0,0,6,8,6];

deadLoad = 1;
TrussAnalyzer(C,SX,SY,X,Y,L,deadLoad);