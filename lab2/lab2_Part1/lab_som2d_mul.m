function [som, grid, snap_t] = lab_som2d_mul(trainingData, neuronCountW, neuronCountH, trainingSteps, startLearningRate, startRadius, num_snaps)
% som = lab_som2d (trainingData, neuronCountW, neuronCountH, trainingSteps, startLearningRate, startRadius)
% -- Purpose: Trains a 2D SOM, which consists of a grid of
%             (neuronCountH * neuronCountW) neurons.
%             
% -- <trainingData> data to train the SOM with
% -- <som> returns the neuron weights after training
% -- <grid> returns the location of the neurons in the grid
% -- <neuronCountW> number of neurons along width
% -- <neuronCountH> number of neurons along height
% -- <trainingSteps> number of training steps 
% -- <startLearningRate> initial learning rate
% -- <startRadius> initial radius used to specify the initial neighbourhood size
%

% TODO:
% The student will need to copy their code from lab_som() and
% update it so that it uses a 2D grid of neurons, rather than a 
% 1D line of neurons.
% 
% Your function will still return the a weight matrix 'som' with
% the same format as described in lab_som().
%
% However, it will additionally return a vector 'grid' that will
% state where each neuron is located in the 2D SOM grid. 
% 
% grid(n, :) contains the grid location of neuron 'n'
%
% For example, if grid = [[1,1];[1,2];[2,1];[2,2]] then:
% 
%   - som(1,:) are the weights for the neuron at position x=1,y=1 in the grid
%   - som(2,:) are the weights for the neuron at position x=2,y=1 in the grid
%   - som(3,:) are the weights for the neuron at position x=1,y=2 in the grid 
%   - som(4,:) are the weights for the neuron at position x=2,y=2 in the grid
%
% It is important to return the grid in the correct format so that
% lab_vis2d() can render the SOM correctly

N = length(trainingData);
d = length(trainingData(1, :));

if nargin < 5
    startRadius = min(neuronCountH, neuronCountW) / 2.0;
end

neuronCountTotal = neuronCountH * neuronCountW;

% Random sub sample
w = datasample(trainingData, neuronCountTotal);

% Completely random [0 1]
w = rand(neuronCountTotal, d);

grid = zeros(neuronCountTotal, 2);

n = 1;

for y = 1 : neuronCountW
     for x = 1 : neuronCountH
         grid(n, :) = [x, y];
         
         % Nice grid
         w(n, :) = [x / neuronCountH, y / neuronCountW];
         
         n = n + 1;
     end
end

t = 1;

tau1 = trainingSteps;
tau2 = trainingSteps / log(startRadius);

som = cell(num_snaps, 1);
snap_t = zeros(num_snaps, 1);

curr_snap = 1;
snap_step = floor(floor(trainingSteps / num_snaps))
cell_n = 1;

while t <= trainingSteps
    x_n = trainingData(randi(N) , :);
    
    % Obtain all distances from selected sample vector to all neurons.
    diffs = bsxfun(@minus, x_n, w);
    distances = mag(diffs);
    
    % Get closest neuron (most alike / "winner").
    [min_distane, min_ix] = min(distances);
    
    % Learning rate decay.
    n_t = startLearningRate * exp(t / tau1);

    % Get radius for this iteration.
    sigma_t = startRadius * exp(-t / tau2);
    
    min_pos = grid(min_ix, :);
    
    if sigma_t > 1.0
        for k = 1 : neuronCountTotal
            curr_pos = grid(k, :);

            distance = eucdist(min_pos, curr_pos);

            if distance <= sigma_t
                sigma_sqr = sigma_t ^ 2;

                % Kernel function.
                h = exp( -(distance ^ 2) / (2 * sigma_sqr) );

                % Update weights.
                w(k, :) = w(k, :) + n_t * h * (x_n - w(k, :));
            end
        end
    else
        k = min_ix;
        curr_pos = grid(k, :);

        distance = eucdist(min_pos, curr_pos);

        if distance <= sigma_t
            sigma_sqr = sigma_t ^ 2;

            % Kernel function.
            h = exp( -(distance ^ 2) / (2 * sigma_sqr) );

            % Update weights.
            w(k, :) = w(k, :) + n_t * h * (x_n - w(k, :));
        end
    end
	
	if t == curr_snap
	    som{cell_n} = w;
		curr_snap = curr_snap + snap_step;
        snap_t(cell_n) = t;
        cell_n = cell_n + 1;
        t
	end
    
    t = t + 1;
end

end
