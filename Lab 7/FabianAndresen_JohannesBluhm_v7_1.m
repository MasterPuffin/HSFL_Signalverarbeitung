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

cos = funcGeneratePeriodic(1, amp, freq, 0, td, fa, 0);
rechteck = funcGeneratePeriodic(4, amp, freq, 0, td, fa, 0);
dreieck = funcGeneratePeriodic(3, amp, freq, 0, td, fa, 0);
saegezahn = funcGeneratePeriodic(2, amp, freq, 0, td, fa, 0);

rauschen = randn(fa,td); % Erzeugt ein Rauschen

%sound(cos, fa);
%sound(rechteck, fa);
%sound(dreieck, fa);
%sound(saegezahn, fa);
%sound(rauschen, fa);
