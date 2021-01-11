
function [yVec, nextPhase] = funcGeneratePeriodic(funcType, amp, fre, phase, duration, fa, fmVec)
  %  [yVec, nextPhase] = funcGeneratePeriodic(type, amp, fre, phase, duration, fa, fmVec)
  %     generiert ein periodisches Signal aus Amplitude (amp 0 .. ), 
  %     Frequenz (fre 0..fa/2), Phase (phase 0..2*pi), 
  %     Dauer (duration in s), Abtastrate (fa z.B.: 11025)
  %     die Länge von yVec beträgt floor(duration * fa)
  %     falls die Länge von fmVec gleich floor(duration*fa) ist:
  %         fmVec enthaelt den zeitlichem Verlauf des Frequenzhubs (FM)
  %     funcType wählt die Kurvenform:
  %         1   cosförmiges Signal
  %         2   sawtooth, sägezahnförmiges Signal 
  %         3   dreieckförmiges Signal
  %         4   rectangle, rechteckförmiges Signal
  %     Falls fre negativ ist, wird amp ignoriert und es wird 
  %         eine Pause der Länge duration generiert.
  %     liefert zusätzlich den letzten Phasenzustand inkrementiert um 
  %     "1/fa" zurueck, wird diese als Startphase des nachfolgenden 
  %     Segments verwendet, lassen sich einfach phasenkontinuierliche
  %     Verläufe realisieren
  % tas 4.11.12
    
  if fre < 0 
    amp = 0;
  end
  
  nLen = floor(duration*fa);
  
  if ( length(fmVec) ~= nLen )
      fmVec = zeros(1, nLen);
  end
  
  tVec = (0 : 1 : nLen-1)/fa;
  phVec = 2 * pi * fre * tVec + phase + 2 * pi * (1/fa) * cumsum(fmVec);
  switch funcType   %##scilab: select
      case 1,
        yVec = amp * cos(phVec);
      case 2,
        yVec = amp * sawtooth(phVec);  %##not available in scilab
      case 3,
        yVec = amp * sawtooth(phVec, 0.5); %##not available in scilab
      case 4,
        yVec = amp * square(phVec);
  end
  
  nextPhase = mod (2 * pi * fre * (duration) + phase, 2*pi);  %##scilab: modulo

