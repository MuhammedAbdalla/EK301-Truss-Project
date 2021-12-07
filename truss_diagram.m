% Copyright Muhammed abdalla muhabda@bu.edu 2021
% Group Members: Maha Noor, Johnson Yang
% Class EK301 Section A5 Fall 2021

function truss_diagram(C, X, Y, Pcrit, T)  
    close all
    P_Delta = [-8.9, 0, 8.9];
    TextCrit = ["Weak", "Nominal", "Strong"];
    for i = 1:3 
        figure(i);
        hold on 
    %     Max_X = max(X);
    %     Max_Y = max(Y);
    %     plot([-5 Max_X+10], [-5 Max_Y+10],'.');
        [vertices, members] = size(C);
        title(sprintf('%s case for EK301 Truss Project', TextCrit(i)));
        xlabel('Length (in)') 
        ylabel('Height (in)') 
        for M = 1:members
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

            Labels = {sprintf('Load M%d: %.2f oz',M, T(M))};
            formatPlot = 'k.-';
            if (T(M) > 0)
                formatPlot = 'r.%s';
            elseif (T(M) < 0)
                formatPlot = 'b.%s';

            end
            if (abs(T(M)) > Pcrit(M)+P_Delta(i))
                formatPlot = sprintf(formatPlot,'--');
            else
                formatPlot = sprintf(formatPlot,'-');
            end
            plot(X(indx),Y(indx),formatPlot,'LineWidth',2);

            midPoint = .5*[X(indx(2))-X(indx(1)),Y(indx(2))-Y(indx(1))];
            text(midPoint(1)+X(indx(1)),midPoint(2)+Y(indx(1)),Labels,...
            'FontSize',8,'HorizontalAlignment','left','VerticalAlignment','top');
        end
        hold off
    end
end