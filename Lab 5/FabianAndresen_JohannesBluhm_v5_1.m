% Analog Synthesizer - Tonleiter
%
% Fabian Andresen und Johannes Bluhm 01.12.2020
%
% MATLAB R2019b
%
% Bearbeiten von einfachen Signalen (Tönen)
%
% Abgabe Donnerstag, 03.12.2020

clc;       % Kommandofenster bereinigen
clear;     % Variablen bereinigen
close all; % Alles schließen

% Parameter
fa = 11025;   % Abtastrate
td = 0.5;    % Signaldauer
a = 1;        % Amplitude (Lautstärke)

% Berechnung
t = 1/fa;              % Abtastperiode
tVec = 0 : t : td - t; % Zeitvektor

% Tonleiter
c = 261.6;
cis = nthroot(2, 12) ^ 1 * c;
d = nthroot(2, 12) ^ 2 * c;
dis = nthroot(2, 12) ^ 3 * c;
e = nthroot(2, 12) ^ 4 * c;
f = nthroot(2, 12) ^ 5 * c;
fis = nthroot(2, 12) ^ 6 * c;
g = nthroot(2, 12) ^ 7 * c;
as = nthroot(2, 12) ^ 8 * c;
a = nthroot(2, 12) ^ 9 * c;
ais = nthroot(2, 12) ^ 10 * c;
h = nthroot(2, 12) ^ 11 * c;

% Pausefreq
pause = 0;
