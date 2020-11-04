% Einführung in Matlab – Programmieren eines Sinussignals
%
% Fabian Andresen und Johannes Bluhm 02.11.2020
%
% MATLAB R2019b
%
% Dieses Programm generiert ein Sinussignal, grafisch und hörbar
%
% Abgabe Donnerstag, 5.11.2020

% Parameter
fa = 11025 % Abtastrate
f = 1000   % Signalfrequenz
td = 2     % Signaldauer
a = 2      % Amplitude (Lautstärke)

% Berechnung
T = 1/fa           % Abtastperiode
tVec = 0 : T : td; % Zeitvektor
sinVec = a * sin(2 * pi * f * tVec); % Sinusformel

% Ausgabe

% Komplette 2 Sekunden Ausgabe
figure(1)
subplot(3, 1, 1)
plot(tVec, sinVec);
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Komplette Sinus Ausgabe'); % Titel des Graphs

% Halbe Sekunde
subplot(3, 1, 2)
plot(tVec(1:td*fa/4), sinVec(1:td*fa/4));
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Eine halbe Sekunde'); % Titel des Graphs

% Ein Sinuszyklus
subplot(3, 1, 3)
plot(tVec(1:12), sinVec(1:12));     % Regulärer Sinus wird erzeugt
%plot(tVec(1:12), sinVec(1:12), '*'); % Einzelne Abtastungen werden angezeigt
xlabel('Zeit in t/s'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title('Ein Sinuszyklus'); % Titel des Graphs

% Aufgabe 2.2 Signal mit sound Befehl ausgeben
%sound (sinVec, 4000);
%sound (sinVec);
%sound (sinVec, fa);
%sound (sinVec, 2 * fa);
