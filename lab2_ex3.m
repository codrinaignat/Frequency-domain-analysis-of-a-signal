% Ex3 -- Analiza in domeniul frecventa a unui semnal audio
clc;
clear;

%2. Motivati alegerea valorii de 44100Hz pentru frecventa de esantionare
%Pentru ca este semnal audio
%setarea frecventei de esantionare si incarcarea semnalului audio de analizat
Fs = 44100;

% !!! 3. Rulati acest cod pentru a incarca un fisier audio si a genera raspunsul in magnitudine si faza al semnalului audio incarcat
y = audioread('guitartune.wav');
NFFT = length(y);
Y = fft(y,NFFT);
F = ((0:1/NFFT:1-1/NFFT)*Fs).';
magnitudineY = abs(Y);        % Magnitudinea FFT
fazaY = unwrap(angle(Y));  % Faza FFT
helperFrequencyAnalysisPlot1(F,magnitudineY,fazaY,NFFT)


% % !!! 4. Continuati si incercati ascultarea semnalului audio incarcat.
% %ascultarea sunetului original
% hplayer = audioplayer(y, Fs);
% play(hplayer);

% % !!! 5. Reconstruiti semnalul initial utilizand vectorii de frecventa, faza si magnitudine si apoi ascultati semnalul reconstruit.
% %refacerea semnalului initial (IFFT)
% y1 = ifft(Y,NFFT,'symmetric');
% norm(y-y1)
% hplayer = audioplayer(y1, Fs);
% play(hplayer);


% % !!! 6. Anulati frecventele peste 1000HZ din semnalul initial si apoi ascultati semnalul astfel obtinut. Ce observati?
% %Anularea frecventelor sub/peste o anumita frecventa
% Ylp = Y;
% Ylp(F>3400) = 0;
% Ylp(F<300) = 0;
% helperFrequencyAnalysisPlot1(F,abs(Ylp),unwrap(angle(Ylp)),NFFT,...
% 'Componentele cu frecventa mai mare de 1 kHz au fost anulate')

% ylp = ifft(Ylp,'symmetric');
% hplayer = audioplayer(ylp, Fs);
% play(hplayer);


% !!! 7. Setati faza tuturor componentelor semnalului la 0 si apoi ascultati semnalul rezultat. Ce observati?
% Modificarea fazei componentelor semnalului initial
Yzp = abs(Y);
helperFrequencyAnalysisPlot1(F,abs(Yzp),unwrap(angle(Yzp)),NFFT,[],...
  'Faza a fost setata la 0 zero')
 
yzp = ifft(Yzp,'symmetric');
hplayer = audioplayer(yzp, Fs); 
play(hplayer);