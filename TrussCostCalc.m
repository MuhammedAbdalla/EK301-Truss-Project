% # of edges
edges = 13

% length
n = 6

% cost of 1 joint
C1 = 10

% cost per inch of an edge
C2 = 1

% # joints
J = 9

% total length
L = n * edges + 2*n

% Cost
Cost = C1 * J + C2 * L

M = 2*J - 3
