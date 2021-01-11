function yVec = funcRidft(specVec, phaVec, N) 
%
% yVec = funcRidft(specVec, phaVec)
%
% berechnet RIDFT via ifft
%
% specVec ist das einseitige Amplitudenspektrum
% phaVec der Phasenverlauf
% N gibt die Länge von yVec an. 
% Falls N ungeradzahlig ist, werden floor(N/2)+1 viele Koeff zur Berechnung 
%           verwendet
%     sonst: N/2+1 viele
%
% falls specVec und phaVec hierfuer nicht genügend viele Werte enthalten, 
%     werden sie mit 0en aufgefüllt.

% tas 2.11.2012
%

% Ueberpruefung der Inputs:
s = size(specVec);
if ( s(1,1) > 1 )
    disp('funcRidft():  Error: Input specVec muss ein Zeilenvektor sein !!!');
    return;
end
s = size(phaVec);
if ( s(1,1) > 1 )
    disp('funcRidft():  Error: Input phaVec muss ein Zeilenvektor sein !!!');
    return;
end

% Auffuellen
len = length(specVec);
if (len < (floor(N/2)+2))
    specVec = [specVec zeros(1, floor(N/2)+3 - len)];
end
len = length(phaVec);
if (len < (floor(N/2)+2))
    phaVec = [phaVec zeros(1, floor(N/2)+3 - len)];
end

% untere Hälfte der FFT-Koeff:
specVec(1) = specVec(1) * 2;
fftVec = N/2 * specVec(1:floor(N/2)+1) .* exp(j*phaVec(1:floor(N/2)+1));
if (mod (N, 2) == 0)  % falls N geradzahlig, reelen "mittleren" K. bearbeiten
    fftVec(floor(N/2)+1) = fftVec(floor(N/2)+1) * 2;
    fftTeil = fftVec(2:floor(N/2));
else
    fftTeil = fftVec(2:floor(N/2)+1);
end
% flippen, konjugieren und zusammenbauen:
fftVec(floor(N/2)+2:N) = conj(fftTeil(length(fftTeil):-1:1));

yVec = real(ifft(fftVec));  % Imaginärteil sollte 0 sein 


