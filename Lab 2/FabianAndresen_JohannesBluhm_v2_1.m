% Einführung in Funktionen
%
% Fabian Andresen und Johannes Bluhm 11.11.2020
%
% MATLAB R2019b
%
% Abgabe Donnerstag, 12.11.2020

clc;       % Kommandofenster bereinigen
clear;     % Variablen bereinigen
close all; % Alles schließen




% Aufgabe 2.2 a
% Obere Frequenz
figure(1) % Fenster
subplot(3, 1, 1) % Graphenanordnung
plot(tVec, sinVec); % Sinus wird erzeugt im Fenster
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Komplette Sinus Ausgabe'); % Titel des Graphs

% Aufgabe 2.2 b
% kleine obere Frequenz
subplot(3, 1, 2) % Graphenanordnung
plot(tVec(ceil(1:td*fa/4)), sinVec(ceil(1:td*fa/4))); % Sinus wird erzeugt im Fenster
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Eine halbe Sekunde'); % Titel des Graphs

% Aufgabe 2.2 c
% Große obere Frequenz
subplot(3, 1, 3) % Graphenanordnung
plot(tVec(1:ceil(fa/f)), sinVec(1:ceil(fa/f))); % Sinus wird erzeugt im Fenster
xlabel('Zeit in t/s'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Ein Sinuszyklus'); % Titel des Graphs
