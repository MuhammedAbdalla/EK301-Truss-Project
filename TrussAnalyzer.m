% Copyright Muhammed abdalla muhabda@bu.edu 2021
% Group Members: Maha Noor, Johnson Yang
% Class EK301 Section A5 Fall 2021

function TrussAnalyzer(C, Sx, Sy, X, Y, L, deadLoad)
    % ALGORITHM
    [vertices, members] = size(C);
    Structure_Pins = [Sx ; Sy];
    Member_Matrix = zeros(2*vertices, members);
    % we got this ratio from the buckling lab
    % acrylic weight/length
        OzPerInch = 0.065;
    Pcrit = zeros(1,members);
    W_failure = zeros(members,3);
    % method of joints for x
    totalLen = 0;
    fprintf('Member\t\t\tLength(in)\tP_crit(oz)\n');
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
        
        % Finds the vector lenghts from origin to pin j1 and j2 of member m
        xSq = (X(indx(2))-X(indx(1))) * (X(indx(2))-X(indx(1)));
        ySq = (Y(indx(2))-Y(indx(1))) * (Y(indx(2))-Y(indx(1)));
        % calculates |r| from j1 to j2
        R = sqrt(xSq + ySq);
        totalLen = totalLen + R;
        
        % Dead Weight approximations
        if (deadLoad == 1)
            % members + M represents all y components
            L(vertices+indx(1)) = L(vertices+indx(1)) + R*OzPerInch/2;
            L(vertices+indx(2)) = L(vertices+indx(2)) + R*OzPerInch/2;
        end
        % Pcrit calculations
        Pcrit(M) = 2570/(R^2);
        
        % Weight Failure of the member
        W_failure(M,1) = (Pcrit(M)+R*OzPerInch)/R;
        W_failure(M,2) = (Pcrit(M)-8.9-R*OzPerInch)/R;
        W_failure(M,3) = (Pcrit(M)+8.9-R*OzPerInch)/R;
        % method of joints for x
        Member_Matrix(indx(1),M) = (X(indx(2))-X(indx(1)))/R;
        Member_Matrix(indx(2),M) = (X(indx(1))-X(indx(2)))/R;
        % method of joints for y
        Member_Matrix(vertices + indx(1),M) = (Y(indx(2))-Y(indx(1))) /R;
        Member_Matrix(vertices + indx(2),M) = (Y(indx(1))-Y(indx(2))) /R;
        
        fprintf('Member %d:\t\t%.3f\t\t%.3f\n', M, R, Pcrit(M));
    end
    A = [Member_Matrix Structure_Pins];
    T = inv(A) * L;

    % PRINTING
    function printDetails()   
        disp('EK301, Section A5, Group n: Muhammed A, Maha N, Johnson Y., 11/12/2021')
        fprintf('Load: %.2foz\nMember forces in oz:\n',sum(L));

        for i = 1:size(T)
            if (i < (members+3 - 2))
                if (T(i) < 0)
                    fprintf('m%d\t%.3f\t(C)\n',i,T(i));
                elseif (T(i) > 0)
                    fprintf('m%d\t%.3f\t(T)\n',i,T(i));
                else
                    fprintf('m%d\t%.3f\t(Z)\n',i,T(i)); 
                end
            else
                if (i == members+3 - 2)
                    fprintf('Reaction forces in oz:\n')
                    fprintf('Sx1: %.3f\n',T(i));
                elseif (i == members+3 - 1)
                    fprintf('Sy1: %.3f\n',T(i));
                elseif (i == members+3)
                    fprintf('Sy2: %.3f\n',T(i));
                end
            end
        end
        cost = 10*vertices + totalLen;
        fprintf('Cost of truss: $%.2f\n',cost);
        fprintf('Theoretical max load/cost ratio in oz/$: %.4f\n', sum(L)/cost);
    end
    disp('FAILURE WEIGHTS');
    for M = 1:members 
        fprintf('Member %d:\t%.2f +/- %.2f oz\n',M,W_failure(M,1),W_failure(M,3)-W_failure(M,2));
    end
    printDetails();
    truss_diagram(C, X,Y,Pcrit,T);
end