close all; clear; clc;

%% Create a 2D Environment (with Red and Green grids)

M = 5;
N = 5;
World = create2D(M, N);
Map = zeros(M,N);

for i = 1:M
    for j = 1:N
        if isequal(World{i,j},'green')
            Map(i,j) = 1;
        else
            Map(i,j) = 0;
        end
    end
end

figure;
colormap(prism(256));
imagesc(Map);

P = ones(M,N)/(M*N);

%% Localization of Robot (By Repeated Sense and Move)

Z = {'red','red','red';
     'green','green','red';
     'green','red','red';
     'green','green','red';
     'red','red','green'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Here I considered that multiple sensor readings are fed to the Sense
% Algorithm. For instance 3 Sensors connected to the Robot senses the
% Grid simultaneously and the Posterior Probability of one sensor is fed to
% the next. The output of this function is the Posterior Probability of the
% last sensor. Each row of 'Z' represents the three sensors readings.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

U = [0 1 -1 0 0];
V = [-1 0 0 1 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Motion of the Robot in the Environment can be represented as follows.

%   U = 0; V = 0; % No Motion
%   U = 0; V = 1; % Right
%   U = 0; V = -1; % Left
%   U = 1; V = 0; % Up
%   U = -1; V = 0; % Down

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:size(Z,1)
    Q = sense2D(P, Z(i), World);
    Q_New = move2D(Q, U(i), V(i));
    P = Q_New;
end

figure;
colormap(gray);
imagesc(Q_New);
