% Rücktransformation in den Zeitbereich
%
% Fabian Andresen und Johannes Bluhm 05.01.2021
%
% MATLAB R2019b
%
% Arbeiten mit der Funktion funcRidft, Zusammenhang zwischen Transformation und Rücktransformation erkennen
%
% Abgabe Montag, 11.01.2021

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
recVec = zeros(1, td * fa); % Vorbereiteter Vector

recVec (floor(0.1*fa) : floor(0.3*fa)) = ones;              % Vektor mit Einsen füllen
[freqVec, phaVec] = funcRdft(recVec, length(recVec));       % Transformieren mittels funcRdft

figure(1);
subplot(3, 1, 1);
plot(tVec, recVec);                                         % Ausgabe Signal im Zeitbereich
xlabel('Zeit t/s');                                         % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title('Rechteck im Zeitbereich');

subplot(3, 1, 2);
plot(freqVec(1:20));                                        % Ausgabe Signal im Frequenzbereich
xlabel('Frequenz Hz');                                      % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title('Rechteck im Frequenzbereich mit einer oberen Frequenz von 20');

freqVecR = funcRidft(freqVec, phaVec, length(recVec));      % Rücktransformieren mittels funcRidft

subplot(3, 1, 3);
plot(tVec, freqVecR);                                         % Ausgabe Signal im Zeitbereich
xlabel('Zeit t/s');                                         % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title('Rechteck im Zeitbereich');

cosVec1 = funcGeneratePeriodic(1, amp, phaVec(2), 0, td, fa, 0);
cosVec2 = funcGeneratePeriodic(1, amp, phaVec(3), 0, td, fa, 0);
cosVec3 = funcGeneratePeriodic(1, amp, phaVec(4), 0, td, fa, 0);
cosVec4 = funcGeneratePeriodic(1, amp, phaVec(5), 0, td, fa, 0);
cosVec5 = funcGeneratePeriodic(1, amp, phaVec(6), 0, td, fa, 0);
cosVec = cosVec1 + cosVec2 + cosVec3 + cosVec4 + cosVec5;

figure(2);
plot(tVec, cosVec, 'b', tVec, cosVec1, 'r', tVec, cosVec2, 'r', tVec, cosVec3, 'r', tVec, cosVec4, 'r', tVec, cosVec5, 'r');                                         % Ausgabe Signal im Zeitbereich
xlabel('Zeit t/s');                                         % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title('Rechteck im Zeitbereich');