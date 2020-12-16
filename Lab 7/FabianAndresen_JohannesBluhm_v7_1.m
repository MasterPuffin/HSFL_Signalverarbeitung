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

% Für die 3 weiteren Töne neben cos muss die Signal Processcing Toolbox installiert werden
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

wavLang = audioread('/S_a.wav')';  %!
% figure(9);   
% plot(wavLang)
wavKurz = wavLang(119:10171);  %!
hannVec = wavKurz .* hann(length(wavKurz))'; %!

transCos = funcRdft(cosVec, length(cosVec));  %!
transRechteck = funcRdft(rechteckVec, length(rechteckVec));  %!
transDreieck = funcRdft(dreieckVec, length(dreieckVec));  %!
transSaegezahn = funcRdft(saegezahnVec, length(saegezahnVec));  %!
transRauschen = funcRdft(rauschenVec, length(rauschenVec));  %!

transWav = funcRdft(wavLang, length(wavLang)); %!

figure(1);
subplot(5, 1, 1);
plot(tVec(1:100), cosVec(1:100));               % Ausgabe 100 Werte Cosiuns-Signal im Zeitbereich
xlabel('Zeit in Samples');                      % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Zeitbereich Cosinus');

subplot(5, 1, 2);
plot(tVec(1:100), rechteckVec(1:100));          % Ausgabe 100 Werte Rechteck-Signal im Zeitbereich
xlabel('Zeit in Samples');                      % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Zeitbereich Rechteck');

subplot(5, 1, 3);
plot(tVec(1:100), dreieckVec(1:100));           % Ausgabe 100 Werte Dreieck-Signal im Zeitbereich
xlabel('Zeit in Samples');                      % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Zeitbereich Dreieck');

subplot(5, 1, 4);
plot(tVec(1:100), saegezahnVec(1:100));         % Ausgabe 100 Werte Sägezahn-Signal im Zeitbereich
xlabel('Zeit in Samples');                      % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Zeitbereich Sägezahn');

subplot(5, 1, 5);
plot(tVec(1:100), rauschenVec(1:100));          % Ausgabe 100 Werte Rauschen-Signal im Zeitbereich
xlabel('Zeit in Samples');                      % x-Achse wird beschriftet                             
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Zeitbereich Rauschen');                  

figure(2);
subplot(5, 1, 1);
plot(freqVec, transCos);                        % Ausgabe Cosiuns-Signal im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet  
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich Cosinus');

subplot(5, 1, 2);
plot(freqVec, transRechteck);                   % Ausgabe Rechteck-Signal im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich Rechteck');

subplot(5, 1, 3);
plot(freqVec, transDreieck);                    % Ausgabe Dreieck-Signal im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich Dreicke');

subplot(5, 1, 4);
plot(freqVec, transSaegezahn);                  % Ausgabe Sägezahn-Signal im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich Sägezahn');              

subplot(5, 1, 5);
plot(freqVec, transRauschen);                   % Ausgabe Rausch-Signal im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich Rauschen');

figure(3);
subplot(4, 1, 1);
plot(tVec(1:1000), wavLang(1:1000));            % Ausgabe 1000 Werte langes wav A Signal
xlabel('Zeit in Samples');                      % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Zeitbereich langes A');

subplot(4, 1, 2);
plot(tVec(1:1000), wavKurz(1:1000));          % Ausgabe 1000 Werte kurzes wav A Signal
xlabel('Zeit in Samples');                      % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Zeitbereich kurzes A');

subplot(4, 1, 3);
plot(tVec(1:1000), hannVec(1:1000));            % Ausgabe 1000 Werte gefenstertes Signal
xlabel('Zeit in Samples');                      % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Zeitbereich gefenstertes A');

subplot(4, 1, 4);
plot(freqVec(1:length(transWav)), transWav);    % Ausgabe wav A im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich A');

figure(4);
subplot(2, 2, 1);
plot(freqVec, transRechteck);                   % Ausgabe Rechteck-Signal im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich Rechteck');

subplot(2, 2, 2);
plot(freqVec, transDreieck);                    % Ausgabe Dreieck-Signal im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich Dreieck');

subplot(2, 2, 3);
plot(freqVec, transSaegezahn);                  % Ausgabe Sägezahn-Signal im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich Sägezahn');

subplot(2, 2, 4);
plot(freqVec(1:length(transWav)), transWav);    % Ausgabe wav A Signal im Frequenzbereich
xlabel('Freuqenz in Hz');                       % x-Achse wird beschriftet
ylabel('Amplitude');                            % y-Achse wird beschriftet
title('Frequenzbereich A');
