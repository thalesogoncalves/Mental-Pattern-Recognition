clear all, close all, clc
limite = 3e5;
%alvo = 3;
SinaisEEG = [];

CarregaDados5s
figure(1), close, figure(2), close
for i=1 : 100
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
            
            dif1 = sum(abs( PSD(i,:) - PSD_1 ));
            dif2 = sum(abs( PSD(i,:) - PSD_2 ));
            dif3 = sum(abs( PSD(i,:) - PSD_3 ));
            
            [junk, Classe(i)] = min([dif1 dif2 dif3]);
        
        else
            
            Classe(i) = 2;
            
        end
        
        figure('position', [10, 400, 400, 315]), hold
        plot(PSD(i,:),'k'), title( num2str(Classe(i)) ), ylim([0 4]*1e5)
        plot(PSD_1,'r-.'), plot(PSD_2,'g-.'), plot(PSD_3,'b-.'), plot(1:140,repmat(limite,1,140),'m')
        
        
    catch lasterror
        i=i-1;
    end    
    
    fID = fopen('C:\Users\Thales\PycharmProjects\AplicacaoTCC\Classe.txt','w');
    fprintf(fID,'%i', Classe(i));
    fclose(fID);
    
while toc<1.5, end
end
fID = fopen('C:\Users\Thales\PycharmProjects\AplicacaoTCC\Classe.txt','w');
fprintf(fID,'%i', 0);
fclose(fID);

% rejeicao = sum(Classe==0);
% acerto = sum(Classe==alvo);
% erro = numel(Classe)-acerto-rejeicao;
% 
% disp( cat(2,'Rejeição: ',num2str(100*rejeicao/numel(Classe)),'%'))
% disp( cat(2,'Acerto: ',num2str(100*acerto/(acerto+erro)),'%'))


















