% FIR Filterprogrammierung
%
% Fabian Andresen und Johannes Bluhm 18.01.2021
%
% MATLAB R2019b
%
% Analysieren eines einfachen digitalen Systems mit Hilfe von MatLab, Untersuchen eines Sprachfiles
%
% Abgabe Montag, 21.01.2021

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

fr1 = freq1/(fa/2);
fr2 = freq2/(fa/2);

lowpass = fir1(96,[fr1],'low');
freqz(lowpass,a);
final = filter(lowpass,a,cosVec);

subplot(2,1,1)
func_fDarstellung(cosVec, fa, 2000);
%sound(cosVec);

subplot(2,1,2)
func_fDarstellung(final, fa, 2000);
%sound(final);
