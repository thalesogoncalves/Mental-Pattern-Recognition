function [SinaisEEG, PSD]=fcn(FimSinalAnterior,Color)

%%
% Vari�veis de Comando
%%%%%%%%%%%%%%%%%%%%%%%%

Eletrodos = ['F4';'Fz';'F3';'C4';'C3']; %Eletrodos a serem lidos.
%limitesEEG = [-800 800]; %Limites dos gr�ficos dos sinais de EEG.
%limitesPSD = [0 20]*1e7; %Limites dos gr�ficos dos sinais de PSD.

fs = 200; %Frequ�ncia de amostragem (Hz)
fo = 8; %Frequ�ncia inicial de an�lise (Hz)
ff = 30; %Frequ�ncia final de an�lise (Hz)

%%
% Inicializa��o de Vari�veis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Filter = load('Filter');
Filter = Filter.Filter3;
Num = Filter(1,:);
Den = Filter(2,:);
clear Filter

%%
% Processamento do Sinal
%%%%%%%%%%%%%%%%%%%%%%%%%

SinaisEEG = LeituraArquivo(Eletrodos);
Sinais = PreProcessamento([FimSinalAnterior SinaisEEG],Num,Den);
[SinaisPSD,f] = CalculaPSD(Sinais,hanning(200),100,200);
[SinaisPSD,f] = CorteEmFrequencia(SinaisPSD,f,fo,ff);
PSD = ConcatenaPSDs(SinaisPSD);

%%
% Plotagens
%%%%%%%%%%%%%
if numel(Color) ~= 0
    
    y_tracejado = (0:0.05:3)*1e5;
    hold,title('PSD'),axis([0 140 0 max(y_tracejado)])

    for k=1 : 4                                 %4 tracejados em cada gr�fico
        x_tracejado = (28*k)*ones(1,length(y_tracejado));
        plot(x_tracejado,y_tracejado,'r--')
    end
    
    plot(PSD,Color)
        
end







