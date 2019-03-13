function Q = move2D(P, U, V)
%% MOVE2D moves the robot in a given 2D environment

%   Input
%       P  - Probability Matrix
%       U  - Movement along Horizontal direction (Left & Right)
%       V  - Movement along Vertical direction (Up & Down)
%
%   Output
%       Q - Probability Matrix after the Robot Motion

%% Function starts here

pCorrect = 0.8; % Probability that Robot moves the correct position
pOverShoot = 0.1; % Probability that Robot exceeds the correct position by 1
pUnderShoot = 0.1; % Probability that Robot preceeds the correct position by 1

if U ~= 0 || V ~= 0
    
    Q = pCorrect * circshift(P,[U,V]);
    if V == 0 % Vertical Movement (Up & Down)
        Q = Q + pOverShoot * circshift(P,[U+1,V]);
        Q = Q + pUnderShoot * circshift(P,[U-1,V]);
    elseif U == 0 % Horizontal Movement (Left & Right)
        Q = Q + pOverShoot * circshift(P,[U,V+1]);
        Q = Q + pUnderShoot * circshift(P,[U,V-1]);
    end
    
else
    Q = P; % No Motion
end

end
