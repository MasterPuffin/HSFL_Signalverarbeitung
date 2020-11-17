% Einführung in Matlab – Programmieren eines Sinussignals
%
% Fabian Andresen und Johannes Bluhm 11.11.2020
%
% MATLAB R2019b
%
% Dieses Programm generiert ein Sinussignal, grafisch und hörbar
%
% Abgabe Donnerstag, 12.11.2020

clc;       % Kommandofenster bereinigen
clear;     % Variablen bereinigen
close all; % Alles schließen

% Parameter
fa = 11025; % Abtastrate
f = 1000;   % Signalfrequenz
td = 2;     % Signaldauer
a = 2;      % Amplitude (Lautstärke)

% Berechnung
t = 1/fa;          % Abtastperiode
tVec = 0 : t : td-t; % Zeitvektor
sinVec = a * sin(2 * pi * f * tVec); % Sinusformel

% Aufgabe 2.2 Signal mit sound Befehl ausgeben
%sound (sinVec, 4000);
disp(length(sinVec)/4000); %Länge des Sounds
%sound (sinVec);
disp(length(sinVec)/8192); %Länge des Sounds
%sound (sinVec, fa);
disp(length(sinVec)/fa); %Länge des Sounds
%sound (sinVec, 2 * fa);
disp(length(sinVec)/(2*fa)); %Länge des Sounds

% Aufgabe 2.3
% Komplette 2 Sekunden Ausgabe
figure(1) % Fenster
subplot(3, 1, 1) % Graphenanordnung
plot(tVec, sinVec); % Sinus wird erzeugt im Fenster
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Komplette Sinus Ausgabe'); % Titel des Graphs

% Aufgabe 2.4
% Halbe Sekunde
subplot(3, 1, 2) % Graphenanordnung
plot(tVec(ceil(1:td*fa/4)), sinVec(ceil(1:td*fa/4))); % Sinus wird erzeugt im Fenster
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Eine halbe Sekunde'); % Titel des Graphs

% Ein Sinuszyklus
subplot(3, 1, 3) % Graphenanordnung
plot(tVec(1:ceil(fa/f)), sinVec(1:ceil(fa/f))); % Sinus wird erzeugt im Fenster
xlabel('Zeit in t/s'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Ein Sinuszyklus'); % Titel des Graphs
