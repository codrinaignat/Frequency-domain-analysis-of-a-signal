% Laborator Interferente si Perturbatii
% 14 Martie 2022

% Ex4 -- Aflarea periodicitatii intr-un semnal

% !!! 2. Rulati acest cod si incarcati datele. Asigurati-va ca acestea au fost incarcate corect prin
%       verificarea valorilor din vectorul de temperatura. Vizualizati graficul in timp al variatilor de
%       temperatura. Puteti observa vreun comportament periodic privind aceste date?
load officetemp.mat
Fs = 1/(60*30);   % Frecventa de esantionare este de 1 esantion la fiecare 30 min
t = (0:length(temp)-1)/Fs;
tempC = (temp-32)/1.8;
helperFrequencyAnalysisPlot2(t/(60*60*24*7),tempC,...
  'Timp in saptamani','Temp')

% % !!! 3. Obtineti reprezentarea in frecventa a semnalului vizualizat la punctul 2. Incercati sa gasiti
% %       periodicitatea in aceasta reprezentare (hint: o saptamana are 7
% %       zile, incercati sa gasiti o corelație)
% 
%analiza datelor in domeniul frecventa
NFFT = length(tempC);              % numarul de puncte FFT
F = (0 : 1/NFFT : 1/2-1/NFFT)*Fs; % Vectorul frecventelor
TEMP = fft(tempC,NFFT);
TEMP(1) = 0; % anularea componentei continue
helperFrequencyAnalysisPlot2(F*60*60*24*7,abs(TEMP(1:NFFT/2)),...
  'Frecventa (cicli/sapt)','Magnitudinee',[],[],[0 10])