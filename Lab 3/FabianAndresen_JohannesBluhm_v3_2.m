% Signalsynthese und Darstellung I - Dreitonfolge
%
% Fabian Andresen und Johannes Bluhm 24.11.2020
%
% MATLAB R2019b
%
% Dieses Program gibt eine Melodie wieder
%
% Abgabe Donnerstag, 26.11.2020

clc;       % Kommandofenster bereinigen
clear;     % Variablen bereinigen
close all; % Alles schließen

% Parameter
fa = 11025;   % Abtastrate
f = 1000;     % Signalfrequenz
td = 0.05;    % Signaldauer
a = 2;        % Amplitude (Lautstärke)

freq1 = 800;  % Frequenz 1
freq2 = 1067; % Frequenz 2
freq3 = 1333; % Frequenz 3

% Berechnung
t = 1/fa;              % Abtastperiode
tVec = 0 : t : td - t; % Zeitvektor
sinVec1 = sin(2 * pi * freq1 * tVec); % Sinus 1
sinVec2 = sin(2 * pi * freq2 * tVec); % Sinus 2
sinVec3 = sin(2 * pi * freq3 * tVec); % Sinus 3

arr = [sinVec1, sinVec3, sinVec1, sinVec2, sinVec3, sinVec2]; % Melodie Array
rep = repmat(arr,1,10); % Wiederholt Kopien eines Arrays

func_fDarstellung(rep, fa, 2000); % Ausgabe des Frequenzspektrums

figure(2); % Zweites Fenster

subplot(4, 1, 1);
plot(tVec(1:31), sinVec1(1:31), '-r'); % Ausgabe
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Erste Sinusausgabe'); % Titel des Graphs

subplot(4, 1, 2);
plot(tVec(1:31), sinVec2(1:31), '-g'); % Ausgabe
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Zweite Sinusausgabe'); % Titel des Graphs

subplot(4, 1, 3);
plot(tVec(1:31), sinVec3(1:31), '-b'); % Ausgabe
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Dritte Sinusausgabe'); % Titel des Graphs

subplot(4, 1, 4);
plot(tVec(1:31), sinVec1(1:31), '-r',tVec(1:31), sinVec2(1:31), '-g',tVec(1:31), sinVec3(1:31), '-b'); % Ausgabe
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Alle Sinusausgaben'); % Titel des Graphs

sound(rep, fa); % Sound
disp(length (rep/fa)); % Länge (Werte) vom gesamten Sound
