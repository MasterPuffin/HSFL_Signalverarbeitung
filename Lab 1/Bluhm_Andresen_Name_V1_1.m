%Johannes Bluhm und Fabian Andresen, 05.11.2020, Laboraufgabe 1, Version 1
%1. – Programmieren eines Sinussignals

clc; %Kommandofenster bereinigen
clear; %Variablen bereinigen
close all; %Alles schließen

Duration = 2;
Frequenz = 1000; % 1kHz Signal
Abtastrate = 11025; % Abtastfrequenz
tVec = 0 : 1/Abtastrate: Duration; % Zeitvektor
sinVec = sin( 2 * pi * Frequenz * tVec); % Sinus


% Ton ausgeben
%sound (sinVec, 4000); % Tiefer Ton ~ 6 sec.
%sound (sinVec); % Mittlerer Ton ~ 3 sec.
%sound (sinVec, Abtastrate); % Hoher Ton ~ 1,5 sec.
%sound (sinVec, 2*Abtastrate) % Sehr hoher Ton ~ 1,5 sec.

plot(sinVec(1:Duration*Abtastrate)) % Ausgabe des gesammten Signals
xlabel('Zeit'); % Achsenbeschriftung 

plot(sinVec(1:Duration*Abtastrate/4)) % Ausgabe 0,5 sec.
xlabel('Zeit'); % Achsenbeschriftung

plot(sinVec(1:12)) % Ausgabe 1 Kurve
xlabel('Zeit'); % Achsenbeschriftung