% A * T = L
% A = [C | S]
% INCLUDE DEAD WEIGHT LOAD
    % using the weight equations of each joint and edge density of acryllic
% C is m * j  matrix

% S is the structural load
    %supported by pin and roller, so there has to be Sx1 Sy1 and Sy2
% L Is a load vector
    % This vector has 2j elements; the first j elements correspond to loads in the x direction for each
    % of the j joints, and the last j elements represent loads along the y direction.
    
% Reference frame: x = [x1 x2 x3... xn] y = [y1 y2 y3... yn]
% L = [xLoad' ; yLoad'] a column vector of loads
% Need an edge vector of all lengths between each joint
    %use a C matrix but instead of 1 replace with length
%FOR EQUIB VALUES:
    %loop thru col's of C if it is 1, then apply equi.b equation
    % R at that col @ i is the DISTANCE. x2-x1 is the change in X
    
% A = [Equib_X ; Equib Y | Sx; Sy]
% T = [#edges T1 - Tn | Sx1 Sy1 Sy2]
% L = [Load_X | Load_Y]

%     1 2 3 4 5 6 7 8 9 a b c d
c1 = [1 0 0 1 0 0 0 0 0 0 0 0 0];
c2 = [1 1 0 0 1 1 0 0 0 0 0 0 0];
c3 = [0 1 1 0 0 0 1 1 0 0 0 0 0];
c4 = [0 0 1 0 0 0 0 0 1 0 0 0 0];
c5 = [0 0 0 1 1 0 0 0 0 1 0 1 0];
c6 = [0 0 0 0 0 1 1 0 0 1 1 0 0];
c7 = [0 0 0 0 0 0 0 1 1 0 1 0 1];
c8 = [0 0 0 0 0 0 0 0 0 0 0 1 1];

C = [c1;c2;c3;c4;c5;c6;c7;c8]

[vertices, members] = size(C);

n = 7.25

p1 = [0 0];
p2 = [n 0];
p3 = [2*n 0];
p4 = [3*n 0];
p5 = 0.5*[n n*sqrt(3)];
p6 = 0.5*[3*n n*sqrt(3)];
p7 = 0.5*[5*n n*sqrt(3)];
p8 = 1.5*[n n*sqrt(3)];
Pins = [p1;p2;p3;p4;p5;p6;p7;p8];

X = Pins(1:end,1);
Y = Pins(1:end,2);

if (3*n < 15)
    disp('TOO SHORT');
end
if ((X(4) - X(1) > 29))
    disp('TOO BIG');
end

Sx1 = zeros(vertices,1); Sy1 = zeros(vertices,1); Sy2 = zeros(vertices,1);

SX = [Sx1 Sy1 Sy2]; SY = [Sx1 Sy1 Sy2];

SX(1,1) = 1; SY(1,2) = 1; SY(4,3) = 1;

Structure_Pins = [SX ; SY];
Member_Matrix = zeros(2*vertices, members);

% method of joints for x
for M = 1:members
    % each member has two joints, so find those two joints
    count = 0;
    indx = [0 0];
    for V = 1:vertices
        if (C(V,M) == 1)
            count = count + 1;
            indx(count) = V;
        end 
        if (count == 2)
            break;
        end
    end
    indx
    
    % Finds the vector lenghts from origin to pin j1 and j2 of member m
    xSq = (X(indx(2))-X(indx(1))) * (X(indx(2))-X(indx(1)));
    ySq = (Y(indx(2))-Y(indx(1))) * (Y(indx(2))-Y(indx(1)));
    % calculates |r| from j1 to j2
    R = sqrt(xSq + ySq)
    Member_Matrix(indx(1),M) = (X(indx(2))-X(indx(1))) /R;
    Member_Matrix(indx(2),M) = (X(indx(1))-X(indx(2))) /R;
    %fprintf("x(%d-%d)/%d\t",cC,cR,n);
    % method of joints for y
    Member_Matrix(vertices + indx(1),M) = (Y(indx(2))-Y(indx(1))) /R;
    Member_Matrix(vertices + indx(2),M) = (Y(indx(1))-Y(indx(2))) /R;
end
Member_Matrix;
A = [Member_Matrix Structure_Pins]
L = zeros(2*vertices,1);
L(vertices+3) = 2;
T = inv(A) * L;

for i = 1:size(T)
    fprintf('%.2f ',T(i))
    if (T(i) < 0)
        fprintf(' oz\tCompression\n');
    elseif (T(i) > 0)
        fprintf(' oz\tTension\n');
    else
        fprintf(' oz\tZero Force\n');  
    end
end

