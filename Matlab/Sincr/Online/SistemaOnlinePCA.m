clear all, close all, clc
%vid = videoinput('winvideo', 1, 'YUY2_320x240');
%preview(vid)
limite = 3e5;
SinaisEEG = [];
load('mn.mat'); load('coeff.mat'); load('RN_pca.mat'); 

for i=1 : 1000
tic
Classe(i) = 0;
    
    try
        [SinalAtual, PSD(i,:)] = eeg(SinaisEEG,'');
        
        SinaisEEG = [SinaisEEG SinalAtual];
        
        [junk, amostras] = size(SinaisEEG);
        if amostras>1000
            SinaisEEG = SinaisEEG(:,end-999:end);
        end
        
        if max(PSD(i,:)) >= limite
            
            RNA_input(i,:) = (PSD(i,:)-mn)*coeff;
            RNA_output(i,:) = sim(RN_pca,RNA_input(i,:)');
            [junk, Classe(i)] = max(RNA_output(i,:));
            
        end
        
        %figure('position', [10, 400, 400, 315])
        %plot(PSD(i,:),'k'), title( num2str(Classe(i)) )
        %ylim([0 3]*1e6), hold, plot(1:140,limite*ones(1,140),'r')
        
        fID = fopen('C:\Users\Thales\PycharmProjects\AplicacaoTCC\Classe.txt','w');
        fprintf(fID,'%i', Classe(i));
        fclose(fID);
    catch lasterror
        i=i-1;
    end    
    
while toc<1.5, end
end
fID = fopen('C:\Users\Thales\PycharmProjects\AplicacaoTCC\Classe.txt','w');
fprintf(fID,'%i', 0);
fclose(fID);


















