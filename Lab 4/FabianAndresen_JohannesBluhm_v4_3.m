% Signalsynthese und Darstellung II - MFV Ton
%
% Fabian Andresen und Johannes Bluhm 24.11.2020
%
% MATLAB R2019b
%
% Dieses Program generiert ein MFV Ton
%
% Abgabe Donnerstag, 26.11.2020

clc;       % Kommandofenster bereinigen
clear;     % Variablen bereinigen
close all; % Alles schließen

% Parameter
fa = 11025;   % Abtastrate
td = 0.09;    % Signaldauer
a = 1;        % Amplitude (Lautstärke)

freq1 = 852;  % Frequenz 1
freq2 = 1209; % Frequenz 2

% Berechnung
t = 1/fa;              % Abtastperiode
tVec = 0 : t : td - t; % Zeitvektor
cosVec1 = a * cos(2 * pi * freq1 * tVec - pi/2); % Sinus 1
cosVec2 = a * 1.25 * cos(2 * pi * freq2 * tVec - pi/2); % Sinus 2

pauseVec = zeros(1 , length(tVec)); % Pausenvektor
cosVec = cosVec1 + cosVec2; % Vektoren addieren

numb = 11; % Wie oft es wiederholt werden muss
arr = [cosVec, pauseVec]; % Ton - Pause abfolge
rep = repmat(arr, 1, numb); % Wiederholt Kopien eines Arrays

tVec2 = 0 : 1 / fa : length(rep);    % Zeitvektor 2 für letzte Ausgabe

sound(rep, fa); % Sound ausgeben

func_fDarstellung(rep, fa, 2000); % Ausgabe des Frequenzspektrums

figure(2); % Neues Fenster

subplot(2, 1, 1);
plot(tVec(1:110), cosVec(1:110), '-r'); % Ausgabe
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Die ersten 10ms'); % Titel des Graphs

subplot(2, 1, 2);
plot(tVec2(1:length(rep)), rep(1:length(rep)), '-r'); % Ausgabe
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Signal und Pause'); % Titel des Graphs
