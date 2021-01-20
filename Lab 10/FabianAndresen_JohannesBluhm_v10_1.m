% FIR Filterprogrammierung
%
% Fabian Andresen und Johannes Bluhm 18.01.2021
%
% MATLAB R2019b
%
% Analysieren eines einfachen digitalen Systems mit Hilfe von MatLab, Untersuchen eines Sprachfiles
%
% Abgabe Donnerstag, 21.01.2021

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

% --- 2.1 --- %

fr1 = (freq1+100)/(fa/2);               % Grenzfrequenz 1 (+100 damit er weniger von der unteren Frequenz filtert)
fr2 = freq2/(fa/2);                     % Grenzfrequenz 2

lowpass = fir1(96,[fr1],'low');         % fir1 wird benutzt
final = filter(lowpass,a,cosVec);       % Filter wird auf cosVec angewandt

figure(1);
subplot(3,1,1)                          
func_fDarstellung(cosVec, fa, 2000);    % Vor dem Filter
title('Ton vor dem Filter');
%sound(cosVec);

subplot(3,1,2)                    
func_fDarstellung(final, fa, 2000);     % Nach dem Filter
title('Ton nach dem Filter');
%sound(final);

subplot(3,1,3)                    
func_fDarstellung(lowpass, fa, 2000);   % Hilft zum erkennen des Filters an sich
title('Grenzfrequenz wird visualisiert');

% --- 2.2 --- %

% Beim verändern der Grenzferquenz bestimmt man ab welcher Frequenz der
% lowpass/highpass Filter angewandt wird.

% Beim verändern der Anzahl der Koeffizienten bestimmt man wie schnell
% diese Kurve abflacht. Sprich wie harsch der Filter sich auswirkt.

wav = audioread('/S_dlma.wav')';        % file einlesen
fr3 = 800/(fa/2);                       % Grenzfrequenz 3
lowpass2 = fir1(442, [fr3], 'low');     % fir1 wird benutzt
finalWav = filter(lowpass2, a, wav);    % Filter wird auf wav angewandt

figure(2);
subplot(4, 1, 1);                       % Vor dem Filter
func_fDarstellung(wav, fa, 2000);       % Ausgabe Sprachsignal im Frequenzbereich vor Filter
title('Wave File ohne Filter im Frequenzbereich')

subplot(4, 1, 2);                       % Nach dem Filter
func_fDarstellung(finalWav, fa, 2000);  % Ausgabe Sprachsignal im Frequenzbereich nach Filter
title('Grenzfrequenz = 800; Koeffizienten = 442');

td2 = length(wav) / fa;                  % Neue Signaldauer
tVec = 0 : t : td2 - t;                  % Neuer Zeitvektor

subplot(4, 1, 3);
plot(tVec, wav);                         % Ausgabe Sprachsignal im Zeitbereich vor Filter
xlabel('Zeit s');                        % x-Achse wird beschriftet
ylabel('Amplitude');                     % y-Achse wird beschriftet
title('Wave File ohne Filter im Zeitbereich')

subplot(4, 1, 4);
plot(tVec, finalWav);                    % Ausgabe Sprachsignal im Zeitbereich nach Filter
xlabel('Zeit s');                        % x-Achse wird beschriftet
ylabel('Amplitude');                     % y-Achse wird beschriftet
title('Wave File mit Filter; Grenzfrequenz = 800; Koeffizienten = 442');
%sound(finalWav);
