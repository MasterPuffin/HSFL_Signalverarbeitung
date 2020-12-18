% Rechteck programmieren und transformieren in den Frequenzbereich
%
% Fabian Andresen und Johannes Bluhm 18.12.2020
%
% MATLAB R2019b
%
% Arbeiten mit Zeros und Ones, Transformation in den Frequenzbereich
%
% Abgabe Donnerstag, 21.12.2020

clc;       % Kommandofenster bereinigen
clear;     % Variablen bereinigen
close all; % Alles schließen

% Parameter
fa = 11025;  % Abtastrate
td = 1;    % Signaldauer
amp = 1;     % Amplitude (Lautstärke)
freq = 1000;  % Frequenz

t = 1/fa;              % Abtastperiode
tVec = 0 : t : td - t; % Zeitvektor

prompt = 'Start Nummer: ';
prompt2 = 'Stopp Nummer: ';

% User wird nach Start und Stopp Nummern gefragt
start = input(prompt);
stopp = input(prompt2);

% Wenn start größer als stopp dann wird getauscht
if start > stopp
    temp = start;
    start = stopp;
    stopp = temp;
end

% Wenn stopp größer als 1 dann stopp = 1, wenn stopp kleiner als 0 dann
% stopp = 1
if 1 < stopp
    stopp = 1;
elseif 0 > stopp
    stopp = 0;
end

% Wenn start kleiner als 0 dann start = 0, wenn start größer als 1 dann
% start = 1
if 0 > start
    start = 0;
elseif 1 < start
    start = 1;
end

% Zum testen des userinputs
%disp(start)
%disp(stopp)
