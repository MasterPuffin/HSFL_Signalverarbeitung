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
plot(0:0.1:2, freqVec(1:21));                            % Ausgabe Signal im Frequenzbereich
xlabel('Frequenz Hz');                                      % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title('Rechteck im Frequenzbereich mit einer oberen Frequenz von 20');

freqVecR = funcRidft(freqVec, phaVec, length(recVec));      % Rücktransformieren mittels funcRidft

subplot(3, 1, 3);
plot(tVec, freqVecR);                                       % Ausgabe Signal im Zeitbereich
xlabel('Zeit t/s');                                         % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title('Rücktransdormiertes Rechteck im Zeitbereich');

figure(2);                                                 
hold on;                                                    % Plot Ausgabe pausieren
recVecR = zeros(1, length(recVec));                         % Vector vorbereiten
anzahlWellen = 500;                                         
for i = 1 : anzahlWellen                                         
    cosVec = funcGeneratePeriodic(1, freqVec(i+1), i, phaVec(i+1), td, fa, 0); % Cosinus Signal erzeugen
    recVecR = recVecR + cosVec;                             % Vektoren addieren
    plot(tVec, cosVec, 'r');                                      % Vektor ausgeben
end                                                       
plot(tVec, recVecR, 'b');                                         % Regenerierten Vektor ausgeben
                                          
text(0.5, 0.7, "Anzahl der Teilwellen: " + anzahlWellen);  % Anzahl der Teilwellen
hold off;                                                   % Plot ausgeben
xlabel('Zeit t/s');                                         % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title('Rechteck zusammengesetzt aus Teilwellen');