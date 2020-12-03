function yVec = funcGeneratePiecewiseLin (relTVec, ampVec, count)
%   yVec = funcGeneratePiecewiseLin (relTVec, relAmpVec, count)
%       erzeugt stückweis lineares Signal der Länge count,
%       relTVec enthält die relativen Zeiten (Start immer mit Null, Ende
%       immer 1), streng monoton steigende Werte, 
%       AmpVec enthält die Amplituden zu diesen Zeitpunkten
%       Bsp.: ADSR-Profile nach Werner, Dig. SigVerarbeitung mit Matlab, 
%           S.34: relTVec = [0 0.15 0.25 0.9 1]; AmpVec = [0 1 0.9 0.7 0]

    
  nCount = floor(count);
  nTVec = floor(relTVec*nCount)+1;       % Zeitvektor
  segmentCount = max(size(relTVec)); % size liefert Zeilen- und Spaltenzahl
  for k = 1 : segmentCount-1  % bearbeiten der Abschnitte
    inc = (ampVec(k+1) - ampVec(k)) / (nTVec(k+1) - nTVec(k)); 
    indexVec = nTVec(k) : nTVec(k+1) - 1;
   
    % Abfrage: Sind zwei aufeinder folgende Werte gleich, dann wird muss
    % ein Eingriff erfolgen, sonst gibt es in der Zeile 
    % yVec(indexVec) = ampVec(k) : inc : ampVec(k+1) - inc; einen Fehler,
    % weil inc dann Null ist!! 
    if ( inc == 0 )
        yVec(indexVec) = ampVec(k);
    else
        yVec(indexVec) = ampVec(k) : inc : ampVec(k+1) - inc;
    end
  end

end
  
  
