function vec = func_fDarstellung(signalVec, fa, obereFreq) % Funktion wird definiert
    disp("Maximale obere Frequenz: " + fa/2);
    if(obereFreq > fa/2) % Wenn obere Frequenz größer ist als Abtastsrate durch 2
    
        obereFreq = floor(fa/2); % Obere Frequenz wird auf Abtastrate durch 2 gesetzt
        disp("Obere Frequenz zu groß und wurde auf " + obereFreq + " reduziert") % Information in der Konsole ausgeben
        
    end
    
    figure(1) % Fenster
    specVec = abs(fft(signalVec, fa));  % Routine zur Spektraldarstellung
    fVec = 0:obereFreq - 1;    % Neuer Vektor für Beschriftung der X-Achse
    plot(fVec, specVec(1:obereFreq));    % Vektor ausgeben    
    title("Obere Frequenz (" + obereFreq + "Hz)"); % Titel des Graphs
    xlabel('Frequenz (Hz)'); % x-Achse wird beschriftet
    ylabel('Amplitude'); % y-Achse wird beschriftet
    
end
