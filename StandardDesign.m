c1 = [1 1 0 0 0 0 0 0 0 0 0 0 0];
c2 = [1 0 1 1 0 0 0 0 0 0 0 0 0];
c3 = [0 0 1 0 1 1 0 0 0 0 0 0 0];
c4 = [0 1 0 1 1 0 1 1 0 0 0 0 0];
c5 = [0 0 0 0 0 1 1 0 1 1 0 0 0];
c6 = [0 0 0 0 0 0 0 1 1 0 1 1 0];
c7 = [0 0 0 0 0 0 0 0 0 1 1 0 1];
c8 = [0 0 0 0 0 0 0 0 0 0 0 1 1];

C = [c1;c2;c3;c4;c5;c6;c7;c8];
[vertices, members] = size(C);

X = [0 0 4 4 8 8 12 12];
Y = [0 4 8 4 8 4 4 0];

Sx1 = zeros(vertices,1); Sy1 = zeros(vertices,1); Sy2 = zeros(vertices,1);

SX = [Sx1 Sy1 Sy2]; SY = [Sx1 Sy1 Sy2];

SX(1,1) = 1; SY(1,2) = 1; SY(8,3) = 1;

L = zeros(2*vertices,1);
L(vertices+4) = 25;

deadLoad = 1;
TrussAnalyzer(C,SX,SY,X,Y,L,deadLoad);
