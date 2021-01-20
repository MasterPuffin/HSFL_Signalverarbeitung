% FIR Filterprogrammierung
%
% Fabian Andresen und Johannes Bluhm 18.01.2021
%
% MATLAB R2019b
%
% Analysieren eines einfachen digitalen Systems mit Hilfe von MatLab, Untersuchen eines Sprachfiles
%
% Abgabe Donnerstag, 21.01.2021

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

cosVec = cosVec1 + cosVec2; % Vektoren addieren

% --- 2.1 --- %

fr1 = (freq1+100)/(fa/2);         % Grenzfrequenz 1 (+100 damit er weniger von der unteren Frequenz filtert)
fr2 = freq2/(fa/2);               % Grenzfrequenz 2

lowpass = fir1(96,[fr1],'low');   % fir1 wird benutzt
final = filter(lowpass,a,cosVec); % Filter wird auf cosVec angewandt

subplot(3,1,1)                    % Vor dem Filter
%func_fDarstellung(cosVec, fa, 2000);
%sound(cosVec);

subplot(3,1,2)                    % Nach dem Filter
%func_fDarstellung(final, fa, 2000);
%sound(final);

subplot(3,1,3)                    % Hilft zum erkennen des Filters an sich
%func_fDarstellung(lowpass, fa, 2000);
title('Grenzfrequenz wird visualisiert');
