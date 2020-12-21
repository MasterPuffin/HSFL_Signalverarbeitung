function [specVec, phaVec] = funcRdft(xVec, N)
%
% [specVec, phaVec] = funcRdft(xVec, N)
%
% berechnet RDFT via fft
%
% specVec ist das einseitige Amplitudenspektrum von xVec
% phaVec der Phasenverlauf
% Länge der beiden Zeilenvektoren: floor(N/2)
%
% falls N kleiner length(xVec): entsprechender Ausschnitt wird analysiert
% N = length(xVec): xVec wird analysiert
% N > length(xVec): xVec wird durch zero padding verlängert

% tas 2.11.2012
%

% Ueberpruefung der Inputs:
s = size(xVec);
if ( s(1,1) > 1 )
    disp('funcRdft():  Error: Input xVec muss ein Zeilenvektor sein !!!');
    return;
end

fftVec = fft(xVec, N);
specVec =  2 * 1/N * abs(fftVec(1:floor(N/2)+1));
% die reellen Koeffizienten haben nur halbes Gewicht:
specVec(1) = specVec(1)/2;
if (mod (N, 2) == 0)  % falls N geradzahlig
    specVec(floor(N/2)+1) = specVec(floor(N/2)+1)/2;  
end
phaVec = angle(fftVec(1:floor(N/2)+1));
