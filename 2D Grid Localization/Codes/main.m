close all; clear; clc;

%% Create a 2D Environment

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

%% Sense

Z = {'red','red'};

Q = sense2D(P, Z, World);

figure;
colormap(gray);
imagesc(Q);

%% Move

%U = 0; V = 0; % No Motion
U = 0; V = 1; % Right
%U = 0; V = -1; % Left
%U = 1; V = 0; % Up
%U = -1; V = 0; % Down

Q_Move = move2D(Q, U, V);

figure;
colormap(gray);
imagesc(Q_Move);

%% Sense

Z = {'red','red'};

Q_New = sense2D(Q_Move, Z, World);

figure;
colormap(gray);
imagesc(Q_New);
