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

% Parameter
fa = 11025; % Abtastrate
f = 1000;   % Signalfrequenz
td = 2;     % Signaldauer
a = 2;      % Amplitude (Lautstärke)

% Berechnung
t = 1/fa;          % Abtastperiode
tVec = 0 : t : td-t; % Zeitvektor
sinVec = a * sin(2 * pi * f * tVec); % Sinusformel

% Aufgabe 2.2 a
% Obere Frequenz
subplot(3, 1, 1) % Graphenanordnung
func_fDarstellung(sinVec, fa, 3000); % Aufruf der Funktion

% Aufgabe 2.2 b
% kleine obere Frequenz
subplot(3, 1, 2) % Graphenanordnung
func_fDarstellung(sinVec, fa, 25); % Aufruf der Funktion

% Aufgabe 2.2 c
% Große obere Frequenz
subplot(3, 1, 3) % Graphenanordnung
func_fDarstellung(sinVec, fa, 10000); % Aufruf der Funktion
