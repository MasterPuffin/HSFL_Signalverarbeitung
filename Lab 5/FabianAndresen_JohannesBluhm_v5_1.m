% Analog Synthesizer - Tonleiter
%
% Fabian Andresen und Johannes Bluhm 01.12.2020
%
% MATLAB R2019b
%
% Bearbeiten von einfachen Signalen (Tönen)
%
% Abgabe Donnerstag, 03.12.2020

clc;       % Kommandofenster bereinigen
clear;     % Variablen bereinigen
close all; % Alles schließen

% Parameter
fa = 11025;  % Abtastrate
td = 0.5;    % Signaldauer
amp = 1;     % Amplitude (Lautstärke)

% Deklarieren von weiteren Variablen
ersterVec = 0; % funcGeneratePeriodic matrix
zweiterVec = 0; % funcGeneratePiecewiseLin matrix
tonleiterVec = 0;
tonleiterVec2 = 0;
bearbeiteterTon = 0;

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

tonleiter = [c, cis, d, dis, e, f, fis, g, as, a, ais, h];

% für tonleiterVec2 (funcGeneratePiecewiseLin)
relTVec = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]; % Zum bearbeiten der Zeit (11 Werte momentan)
AmpVec = [0 0.05 0.1 0.15 0.2 0.25 0.2 0.15 0.1 0.05 0]; % Zum bearbeiten der Amplitude in der Zeit

for x = 1 : length(tonleiter)

    tonleiterVec = funcGeneratePeriodic(1, amp, tonleiter(x), 0, td * length(x), fa, 0);
    ersterVec = [ersterVec, tonleiterVec];
    
    tonleiterVec2 = funcGeneratePiecewiseLin(relTVec, AmpVec, length(tonleiter(x)));
    bearbeiteterTon = tonleiterVec * tonleiterVec2;
    zweiterVec = [zweiterVec, bearbeiteterTon];
    
end

% Soundtest Tonleiter ohne PiecewiseLin function
%sound(ersterVec, fa);

% Soundtest Tonleiter mit PiecewiseLin function
%sound(zweiterVec, fa);

% Gibt die Zeit und Amplitude des veränderten Tons wieder
figure(1)
subplot(1, 1, 1);
plot(relTVec, AmpVec);
xlabel('Zeit');
ylabel('Amp');
