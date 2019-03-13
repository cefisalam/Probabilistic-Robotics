function Q = sense2D(P, Z, World)
%% SENSE2D predicts the robot's location in a given 2D environment 

%   Input
%       P     - Prior Probability Matrix
%       Z     - Measurement obtained from the Sensor of the Robot
%       World - 2D Environment
%
%   Output
%       Q - Posterior Probability Matrix

%% Function starts here

pHit = 0.6; % Sensor's measurement is correct
pMiss = 0.2; % Sensor's measurement is incorrect

[r,c] = size(World); % Size of the Environment

for i = 1:length(Z) % No. of Measurements
    for j= 1:r
        for k= 1:c
            if strcmp(World(j,k),Z(i))
                Q(j,k) = pHit * P(j,k);
            else
                Q(j,k) = pMiss * P(j,k);
            end
        end
    end
    
    % Normalize
    const = 1/sum(sum(Q));
    Q = Q .* const;
    P = Q;
end

end

