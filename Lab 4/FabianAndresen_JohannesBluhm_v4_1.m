% Signalsynthese und Darstellung II - MFV Ton
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
%FIX: Dauer inkorrekt
td = 0.90;    % Signaldauer
a = 1;        % Amplitude (Lautstärke)

freq1 = 852;  % Frequenz 1
freq2 = 1209; % Frequenz 2

% Berechnung
t = 1/fa;              % Abtastperiode
tVec = 0 : t : td - t; % Zeitvektor
cosVec1 = a * cos(2 * pi * freq1 * tVec); % Sinus 1
cosVec2 = a * 1.25 * cos(2 * pi * freq2 * tVec); % Sinus 2
% FIX: Funktioniert nicht
pauseVec = zeros(length(tVec));

%FIX: Vektoren addieren
cosVec = cosVec1;

%arr = [cosVec, pauseVec]; %  Ton - Pause abfolge
%rep = repmat(arr,1,2000/180); % Wiederholt Kopien eines Arrays

%sound(rep, fa); % Sound ausgeben

%func_fDarstellung(rep, fa, 2000); % Ausgabe des Frequenzspektrums

figure(1); % Neues Fenster

subplot(2, 1, 1);
plot(tVec(1:10), cosVec1(1:10), '-r'); % Ausgabe
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet

length = length(cosVec);
subplot(2, 1, 2);
plot(tVec(1:length), cosVec1(1:length), '-r'); % Ausgabe
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet

