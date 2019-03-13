function World = create2D(M, N)
%CREATE2D Creates a 2D Environment of size M*N

%   Input
%       M  - Row Size of Environment
%       N  - Column Size of Environment
%
%   Output
%       World - 2D Environment

%% Function starts here

temp = rand(M,N);

World = {}; % Initialize the Environment

for i = 1:M
    for j = 1:N
        
        % Update the Environment Randomly
        if temp(i,j) <= 0.5
            World(i,j) = {'red'};
        else
            World(i,j) = {'green'};
        end
    end
end

end

