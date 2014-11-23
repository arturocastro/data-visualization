function lab_vis (som, trainingData)
% lab_vis(som, trainingData)
% -- Purpose: Visualize a trained 1D SOM
% -- som: Weight matrix for the trained SOM, attained from lab_som(...)
% -- trainingData: Data used to train the SOM e.g. data returned from
%                  nicering(...)
    numData = size(trainingData,1);
    dimens = size(trainingData, 2);
    
    assert(dimens == 2 || dimens == 3);
    if (dimens == 2)
        scatter(trainingData(:,1), trainingData(:,2));
        hold on;
        for i=1:size(som, 1)-1
            line([som(i,1), som(i+1,1)], [som(i,2), som(i+1,2)], 'Color', 'r', 'LineWidth', 3.0);
        end
        scatter(som(:,1), som(:,2), 'MarkerFaceColor', 'y');
        hold off

    end
    if (dimens == 3)
        scatter3(trainingData(:,1,1), trainingData(:,2,1), trainingData(:,3,1));
        hold on;
        alpha(0.1);
        for i=1:size(som, 1)-1
            line([som(i,1,1), som(i+1,1,1)], [som(i,2,1), som(i+1,2,1)], [som(i,3,1), som(i+1,3,1)], 'Color', 'r', 'LineWidth', 3.0);
        end
        scatter3(som(:,1,1), som(:,2,1), som(:,3,1), 'MarkerFaceColor', 'y');
        hold off
    end

