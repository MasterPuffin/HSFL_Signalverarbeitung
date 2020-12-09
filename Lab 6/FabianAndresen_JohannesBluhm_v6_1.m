% Analog Synthesizer - Ode an die Freude
%
% Fabian Andresen und Johannes Bluhm 07.12.2020
%
% MATLAB R2019b
%
% Bearbeiten von einfachen Signalen (Tönen)
%
% Abgabe Donnerstag, 10.12.2020

clc;       % Kommandofenster bereinigen
clear;     % Variablen bereinigen
close all; % Alles schließen

% Parameter
fa = 11025;  % Abtastrate
td = 0.5;    % Signaldauer
amp = 1;     % Amplitude (Lautstärke)
oFreq = 500;   % Obere Frequenz

% Deklarieren von weiteren Variablen
ersterVec = 0; % funcGeneratePeriodic matrix
zweiterVec = 0; % funcGeneratePiecewiseLin matrix
tonleiterVec = 0;
%tonleiterVec2 = 0;
%bearbeiteterTon = 0;

% Tonleiter
c = 261.6;
cis = nthroot(2, 12) ^ 1 * c;
d = nthroot(2, 12) ^ 2 * c;
dis = nthroot(2, 12) ^ 3 * c;
e = nthroot(2, 12) ^ 4 * c;
f = nthroot(2, 12) ^ 5 * c;
fis = nthroot(2, 12) ^ 6 * c;
g = nthroot(2, 12) ^ 7 * c;
as = nthroot(2, 12) ^ 8 * c;
a = nthroot(2, 12) ^ 9 * c;
ais = nthroot(2, 12) ^ 10 * c;
h = nthroot(2, 12) ^ 11 * c;
p = 0; % pause

odenVec = [e, e, f, g, g, f, e, d, c, c, d, e, e, d, d, e, e, f, g, g];

% für tonleiterVec2 (funcGeneratePiecewiseLin)
%odenTVec = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
%odenAmpVec = [0 0.05 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.40 0.35 0.30 0.25 0.20 0.15 0.10 0.05 0];

for x = 1 : length(odenVec)

    tonleiterVec = funcGeneratePeriodic(1, amp, odenVec(x), 0, td * length(x), fa, 0);
    ersterVec = [ersterVec, tonleiterVec];

    if x == 1
        note1 = tonleiterVec;
    end

    if x == 2
        note2 = tonleiterVec;
    end

    if x == 3
        note3 = tonleiterVec;
    end

    if x == 4
        note4 = tonleiterVec;
    end

end

% Ode Melodie
% sound(ersterVec, fa);

% Ode Melodie mit funcGeneratePiecewiseLin (noch nicht implementiert)
%sound(zweiterVec, fa);

subplot(2, 2, 1);
func_fDarstellung(note1, fa, oFreq); % Ausgabe des Frequenzspektrums
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title(append('Note 1 (e) Frequenz ', num2str(e)));

subplot(2, 2, 2);
func_fDarstellung(note2, fa, oFreq); % Ausgabe des Frequenzspektrums
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title(append('Note 2 (e) Frequenz ', num2str(e)));

subplot(2, 2, 3);
func_fDarstellung(note3, fa, oFreq); % Ausgabe des Frequenzspektrums
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title(append('Note 3 (f) Frequenz ', num2str(f)));

subplot(2, 2, 4);
func_fDarstellung(note4, fa, oFreq); % Ausgabe des Frequenzspektrums
xlabel('Zeit in Sekunden'); % x-Achse wird beschriftet
ylabel('Amplitude'); % y-Achse wird beschriftet
title(append('Note 4 (g) Frequenz ', num2str(g)));
