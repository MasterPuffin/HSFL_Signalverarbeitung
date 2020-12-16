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

t = 1/fa;              % Abtastperiode
tVec = 0 : t : td - t; % Zeitvektor
freqVec = 0 : fa/length(tVec) : fa/2; %!

% Für die 3 weiteren Töne neben cos muss ein Add-On installiert werden
% um sie hören zu können. Einfach auf Run drücken und die Fehlermeldung
% lesen, dann genanntes in Matlab installieren.

cosVec = funcGeneratePeriodic(1, amp, freq, 0, td, fa, 0);
rechteckVec = funcGeneratePeriodic(4, amp, freq, 0, td, fa, 0);
dreieckVec = funcGeneratePeriodic(3, amp, freq, 0, td, fa, 0);
saegezahnVec = funcGeneratePeriodic(2, amp, freq, 0, td, fa, 0);

rauschenVec = randn(1, td * fa); % Erzeugt ein Rauschen
pauseVec = zeros(1, floor(td / 2 * fa));    % Erzeugt Pause

%sound(cosVec, fa);
%sound(rechteckVec, fa);
%sound(dreieckVec, fa);
%sound(saegezahnVec, fa);
%sound(rauschenVec, fa);

signaleVec = [cosVec, pauseVec, rechteckVec, pauseVec, dreieckVec, pauseVec, saegezahnVec, pauseVec, rauschenVec];
%sound(signaleVec, fa);

aWavFull = audioread('/S_a.wav')';  %!
aWavCut = aWavFull(115:10170);  %!
hanVec = aWavCut .* hann(length(aWavCut))'; %!

transCos = funcRdft(cosVec, length(cosVec));  %!
transRechteck = funcRdft(rechteckVec, length(rechteckVec));  %!
transDreieck = funcRdft(dreieckVec, length(dreieckVec));  %!
transSaegezahn = funcRdft(saegezahnVec, length(saegezahnVec));  %!
transRauschen = funcRdft(rauschenVec, length(rauschenVec));  %!

transAWav = funcRdft(aWavFull, length(aWavFull)); %!


figure(1);                                      % Zeichnen in Fenster 1
subplot(5, 1, 1);                               % Erstellung Subplot 1 von 5
plot(tVec(1:100), cosVec(1:100));               % Plotte erste 100 Werte Cosiuns-Signal im Zeitbereich
xlabel('Zeit t/s');                             % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Zeitbereich Cosinus');                   % Benennung Grafik

subplot(5, 1, 2);                               % Erstellung Subplot 2 von 5
plot(tVec(1:100), rechteckVec(1:100));               % Plotte erste 100 Werte Rechteck-Signal im Zeitbereich
xlabel('Zeit t/s');                             % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Zeitbereich Rechteck');                  % Benennung Grafik

subplot(5, 1, 3);                               % Erstellung Subplot 3 von 5
plot(tVec(1:100), dreieckVec(1:100));               % Plotte erste 100 Werte Dreieck-Signal im Zeitbereich
xlabel('Zeit t/s');                             % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Zeitbereich Dreieck');                   % Benennung Grafik

subplot(5, 1, 4);                               % Erstellung Subplot 4 von 5
plot(tVec(1:100), saegezahnVec(1:100));               % Plotte erste 100 Werte S�gezahn-Signal im Zeitbereich
xlabel('Zeit t/s');                             % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Zeitbereich S�gezahn');                  % Benennung Grafik

subplot(5, 1, 5);                               % Erstellung Subplot 5 von 5
plot(tVec(1:100), rauschenVec(1:100));               % Plotte erste 100 Werte Rauschen-Signal im Zeitbereich
xlabel('Zeit t/s');                             % Benennung X-Achse                             
ylabel('Amplitude');                            % Benennung Y-Achse
title('Zeitbereich Rauschen');                  % Benennung Grafik

figure(2);                                      % Zeichnen in Fenster 2
subplot(5, 1, 1);                               % Erstellung Subplot 1 von 5
plot(freqVec, transCos);                        % Plotte Cosiuns-Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse  
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich Cosinus');               % Benennung Grafik

subplot(5, 1, 2);                               % Erstellung Subplot 2 von 5
plot(freqVec, transRechteck);                        % Plotte Rechteck-Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich Rechteck');              % Benennung Grafik

subplot(5, 1, 3);                               % Erstellung Subplot 3 von 5
plot(freqVec, transDreieck);                        % Plotte Dreieck-Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich Dreicke');               % Benennung Grafik

subplot(5, 1, 4);                               % Erstellung Subplot 4 von 5
plot(freqVec, transSaegezahn);                        % Plotte S�gezahn-Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich S�gezahn');              % Benennung Grafik

subplot(5, 1, 5);                               % Erstellung Subplot 5 von 5
plot(freqVec, transRauschen);                        % Plotte Rausch-Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich Rauschen');              % Benennung Grafik

figure(3);                                      % Zeichnen in Fenster 3
subplot(4, 1, 1);                               % Erstellung Subplot 1 von 4
plot(tVec(1:600), aWavFull(1:600));             % Plotte erste 600 Werte eingelesenes Signal im Zeitbereich
xlabel('Zeit t/s');                             % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Zeitbereich eingelesenes A');            % Benennung Grafik

subplot(4, 1, 2);                               % Erstellung Subplot 2 von 4
plot(tVec(1:600), aWavCut(1:600));              % Plotte erste 600 Werte beschnittenes Signal im Zeitbereich
xlabel('Zeit t/s');                             % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Zeitbereich beschnittenes A');           % Benennung Grafik

subplot(4, 1, 3);                               % Erstellung Subplot 3 von 4
plot(tVec(1:600), hanVec(1:600));               % Plotte erste 600 Werte gefenstertes Signal im Zeitbereich
xlabel('Zeit t/s');                             % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Zeitbereich gefenstertes A');            % Benennung Grafik

subplot(4, 1, 4);                               % Erstellung Subplot 4 von 4
plot(freqVec(1:length(transAWav)), transAWav);  % Plotte eingelesenes Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich A');                     % Benennung Grafik

figure(4);                                      % Zeichnen in Fenster 3
subplot(2, 2, 1);                               % Erstellung Subplot 1 von 4
plot(freqVec, transRechteck);                        % Plotte Rechteck-Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich Rechteck');              % Benennung Grafik

subplot(2, 2, 2);                               % Erstellung Subplot 2 von 4
plot(freqVec, transDreieck);                        % Plotte Dreieck-Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich Dreieck');               % Benennung Grafik

subplot(2, 2, 3);                               % Erstellung Subplot 3 von 4
plot(freqVec, transSaegezahn);                        % Plotte S�gezahn-Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich S�gezahn');              % Benennung Grafik

subplot(2, 2, 4);                               % Erstellung Subplot 4 von 4
plot(freqVec(1:length(transAWav)), transAWav);  % Plotte eingelesenes Signal im Frequenzbereich
xlabel('Frequenz Hz');                          % Benennung X-Achse
ylabel('Amplitude');                            % Benennung Y-Achse
title('Frequenzbereich A');                     % Benennung Grafik
