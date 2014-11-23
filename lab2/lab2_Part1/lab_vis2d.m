function win=lab_vis2d (som, grid, trainingData)
% lab_vis2d(som, trainingData)
% -- Purpose: Visualize a trained 2D SOM
% -- som: Weight matrix for the trained SOM, attained from lab_som2d(...)
% -- grid: Matrix giving the location of each neuron in the grid
% -- trainingData: Data used to train the SOM e.g. data returned from
%                  nicering(...)
    numData = size(trainingData,1);
    dimens = size(trainingData, 2);
    
    somH=max(grid);
    somW=max(grid);
    somH=somH(2);
    somW=somW(1);
    
    assert(dimens == 2 || dimens == 3);
    if (dimens == 2)
        scatter(trainingData(:,1), trainingData(:,2));
        hold on;
        
        for i=1:size(grid, 1)
            currentIndex = grid(i,:);
            rightIndex = currentIndex + [1, 0];
            if (rightIndex(1) <= somW)
                findIndex = abs(grid - repmat(rightIndex, size(grid, 1), 1));
                [ignore,j] = min(findIndex(:,1) + findIndex(:,2));
                line([som(i,1,1), som(j,1,1)], [som(i,2,1), som(j,2,1)], 'Color', 'r', 'LineWidth', 3.0);
            end

        	downIndex = grid(i,:) + [0, 1];
        	if (downIndex(2) <= somH)
                findIndex = abs(grid - repmat(downIndex, size(grid, 1), 1));
                [ignore,j] = min(findIndex(:,1) + findIndex(:,2));
                line([som(i,1,1), som(j,1,1)], [som(i,2,1), som(j,2,1)], 'Color', 'r', 'LineWidth', 3.0);
            end
        end

        scatter(som(:,1), som(:,2), 'MarkerFaceColor', 'y');
        hold off

    end
    if (dimens == 3)
        scatter3(trainingData(:,1,1), trainingData(:,2,1), trainingData(:,3,1));
        hold on;
        alpha(0.1);
        
        for i=1:size(grid, 1)
            currentIndex = grid(i,:);
            rightIndex = currentIndex + [1, 0];
            if (rightIndex(1) <= somW)
                findIndex = abs(grid - repmat(rightIndex, size(grid, 1), 1));
                [ignore,j] = min(findIndex(:,1) + findIndex(:,2));
                line([som(i,1,1), som(j,1,1)], [som(i,2,1), som(j,2,1)], [som(i,3,1), som(j,3,1)], 'Color', 'r', 'LineWidth', 3.0);
            end

        	downIndex = grid(i,:) + [0, 1];
        	if (downIndex(2) <= somH)
                findIndex = abs(grid - repmat(downIndex, size(grid, 1), 1));
                [ignore,j] = min(findIndex(:,1) + findIndex(:,2));
                line([som(i,1,1), som(j,1,1)], [som(i,2,1), som(j,2,1)], [som(i,3,1), som(j,3,1)], 'Color', 'r', 'LineWidth', 3.0);
            end
        end
        
        scatter3(som(:,1,1), som(:,2,1), som(:,3,1), 'MarkerFaceColor', 'y');
        hold off
    end

