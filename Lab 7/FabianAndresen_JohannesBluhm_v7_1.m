% Tonerzeugung und Spektraldarstellungen - Synthesizer
%
% Fabian Andresen und Johannes Bluhm 14.12.2020
%
% MATLAB R2019b
%
% Arbeiten mit den Funktionen funcGeneratePeriodic und funcRdft
%
% Abgabe Donnerstag, 17.12.2020

clc;       % Kommandofenster bereinigen
clear;     % Variablen bereinigen
close all; % Alles schließen

% Parameter
fa = 11025;  % Abtastrate
td = 1;    % Signaldauer
amp = 1;     % Amplitude (Lautstärke)
freq = 1000;  % Frequenz

% Für die 3 weiteren Töne neben cos muss ein Add-On installiert werden
% um sie hören zu können. Einfach auf Run drücken und die Fehlermeldung
% lesen, dann genanntes in Matlab installieren.

cosVec = funcGeneratePeriodic(1, amp, freq, 0, td, fa, 0);
rechteckVec = funcGeneratePeriodic(4, amp, freq, 0, td, fa, 0);
dreieckVec = funcGeneratePeriodic(3, amp, freq, 0, td, fa, 0);
saegezahnVec = funcGeneratePeriodic(2, amp, freq, 0, td, fa, 0);

rauschen = randn(fa,td); % Erzeugt ein Rauschen

%sound(cosVec, fa);
%sound(rechteckVec, fa);
%sound(dreieckVec, fa);
%sound(saegezahnVec, fa);
%sound(rauschen, fa);

% Pause fehlt
signaleVec = [cosVec, rechteckVec, dreieckVec, saegezahnVec];
%sound(signaleVec, fa);
