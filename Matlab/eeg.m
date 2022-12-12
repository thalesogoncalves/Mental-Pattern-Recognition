function [SinaisConcPSD]=fcn(File,TestNumber,Color,First)

%%
% Vari�veis de Comando
%%%%%%%%%%%%%%%%%%%%%%%%

File = cat(2,File,'.ASC');
Eletrodos = ['F4';'Fz';'F3';'C4';'C3']; %Eletrodos a serem lidos.
%limitesEEG = [-800 800]; %Limites dos gr�ficos dos sinais de EEG.
%limitesPSD = [0 20]*1e7; %Limites dos gr�ficos dos sinais de PSD.

fs = 200; %Frequ�ncia de amostragem (Hz)
to = 5; %Tempo em que a coleta come�a (s)
td = 10; %Tempo de dura��o da coleta (s)
fo = 8; %Frequ�ncia inicial de an�lise (Hz)
ff = 30; %Frequ�ncia final de an�lise (Hz)

%%
% Inicializa��o de Vari�veis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 0 : 1/fs : td;
t = t(1:end-1);

Filter = load('Filter');
Filter = Filter.Filter3;
Num = Filter(1,:);
Den = Filter(2,:);
clear Filter

%%
% Processamento do Sinal
%%%%%%%%%%%%%%%%%%%%%%%%%

SinaisEEG = LeituraArquivo(File,Eletrodos,TestNumber);
SinaisEEG = CorteNoTempo(SinaisEEG,to,td,fs);
Sinais = PreProcessamento(SinaisEEG,Num,Den);
[SinaisPSD,f] = PSD(Sinais,rectwin(256),128,200);
[SinaisPSD,f] = CorteEmFrequencia(SinaisPSD,f,fo,ff);
SinaisConcPSD = ConcatenaPSDs(SinaisPSD);

%%
% Plotagens
%%%%%%%%%%%%%
if numel(Color) ~= 0
    
    figure(1)
    subplot(2,3,1),plot(t,SinaisEEG(1,:),Color), if First==1, hold,title(Eletrodos(1,:)),xlabel('Tempo (s)'),ylabel('Amplitude'),end%,ylim(limitesEEG),end
    subplot(2,3,2),plot(t,SinaisEEG(2,:),Color), if First==1, hold,title(Eletrodos(2,:)),xlabel('Tempo (s)'),ylabel('Amplitude'),end%,ylim(limitesEEG),end
    subplot(2,3,3),plot(t,SinaisEEG(3,:),Color), if First==1, hold,title(Eletrodos(3,:)),xlabel('Tempo (s)'),ylabel('Amplitude'),end%,ylim(limitesEEG),end
    subplot(2,3,4),plot(t,SinaisEEG(4,:),Color), if First==1, hold,title(Eletrodos(4,:)),xlabel('Tempo (s)'),ylabel('Amplitude'),end%,ylim(limitesEEG),end
    subplot(2,3,6),plot(t,SinaisEEG(5,:),Color), if First==1, hold,title(Eletrodos(5,:)),xlabel('Tempo (s)'),ylabel('Amplitude'),end%,ylim(limitesEEG),end

    figure(2)
    subplot(2,3,1),plot(f,SinaisPSD(1,:),Color), if First==1, hold,title(Eletrodos(1,:)),xlabel('Frequ�ncia (Hz)'),ylabel('Amplitude'),end%,ylim(limitesPSD),end
    subplot(2,3,2),plot(f,SinaisPSD(2,:),Color), if First==1, hold,title(Eletrodos(2,:)),xlabel('Frequ�ncia (Hz)'),ylabel('Amplitude'),end%,ylim(limitesPSD),end
    subplot(2,3,3),plot(f,SinaisPSD(3,:),Color), if First==1, hold,title(Eletrodos(3,:)),xlabel('Frequ�ncia (Hz)'),ylabel('Amplitude'),end%,ylim(limitesPSD),end
    subplot(2,3,4),plot(f,SinaisPSD(4,:),Color), if First==1, hold,title(Eletrodos(4,:)),xlabel('Frequ�ncia (Hz)'),ylabel('Amplitude'),end%,ylim(limitesPSD),end
    subplot(2,3,6),plot(f,SinaisPSD(5,:),Color), if First==1, hold,title(Eletrodos(5,:)),xlabel('Frequ�ncia (Hz)'),ylabel('Amplitude'),end%,ylim(limitesPSD),end

    figure(3)
    plot(SinaisConcPSD,Color), if First==1, hold,grid,title('PSDs Concatenadas'),ylabel('Amplitude'),end%,ylim(limitesPSD),end

end







