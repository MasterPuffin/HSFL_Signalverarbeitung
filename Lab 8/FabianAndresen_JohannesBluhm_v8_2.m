% Rechteck programmieren und transformieren in den Frequenzbereich
%
% Fabian Andresen und Johannes Bluhm 18.12.2020
%
% MATLAB R2019b
%
% Arbeiten mit Zeros und Ones, Transformation in den Frequenzbereich
%
% Abgabe Donnerstag, 21.12.2020

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


prompt = 'Start Nummer: ';
prompt2 = 'Stopp Nummer: ';

% User wird nach Start und Stopp Nummern gefragt
start = input(prompt);
stopp = input(prompt2);

if start > 1 || stopp > 1
    disp('Start und Stop müssen < 1 sein');
    return;
end    
   

% Wenn start größer als stopp dann wird getauscht
if start > stopp
    temp = start;
    start = stopp;
    stopp = temp;
end

% Wenn stopp größer als 1 dann stopp = 1, wenn stopp kleiner als 0 dann
% stopp = 1
if 1 < stopp
    stopp = 1;
elseif 0 > stopp
    stopp = 0;
end

% Wenn start kleiner als oder gleich 0 dann start = 0, wenn start größer als 1 dann
% start = 1
if 0 >= start
    start = t;
elseif 1 < start
    start = 1;
end

% Zum testen des userinputs
%disp(start)
%disp(stopp)

ausschnittVec = 0 : 1 : stopp * 100;             % Ausschnittvektor bestimmen

recVec (floor(start*fa) : floor(stopp*fa)) = ones;    % Vektor mit Einsen füllen

[freqVec, phaVec] = funcRdft(recVec, length(recVec));       % Transformieren mittels funcRdft

figure(1);
subplot(3, 1, 1);
plot(tVec, recVec);                                         % Ausgabe Signal im Zeitbereich
xlabel('Zeit t/s');                                         % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title('Rechteck im Zeitbereich');

subplot(3, 1, 2);
plot(freqVec(1:floor(fa/2)));                               % Ausgabe Signal im Frequenzbereich
xlabel('Frequenz Hz');                                      % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title('Rechteck im Frequenzbereich');

subplot(3, 1, 3);
plot(ausschnittVec, freqVec(1:length(ausschnittVec)));      % Ausgabe erste X Werte
xlabel('Frequenz Hz');                                      % x-Achse wird beschriftet
ylabel('Amplitude');                                        % y-Achse wird beschriftet
title(sprintf('Rechteck im Frequenzbereich bis zu %f', round(stopp * 100, 0)));
