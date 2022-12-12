function [PSD]=fcn(TestNumber, Color, First)

%%
% Variáveis de Comando
%%%%%%%%%%%%%%%%%%%%%%%%

Eletrodos = ['F4';'Fz';'F3';'C4';'C3']; %Eletrodos a serem lidos.
Atividades = ['BDIR'; 'BESQ'; 'NADA'; 'PMLE'; 'PQRI'; 'PBOA'; 'PDIR'; 'PESQ']; %Atividades Possíveis.
%limitesEEG = [-800 800]; %Limites dos gráficos dos sinais de EEG.
%limitesPSD = [0 20]*1e7; %Limites dos gráficos dos sinais de PSD.

fs = 200; %Frequência de amostragem (Hz)
T = 10; %Período de duração de um ciclo de amostragem (s)
to = 4; %Tempo em que a coleta começa (s)
td = 5; %Tempo de duração da coleta (s)
fo = 8; %Frequência inicial de análise (Hz)
ff = 30; %Frequência final de análise (Hz)
NumAtividades = 8; %Numero de atividades mentais possíveis
NumTestes = 6; %Numero de testes em um mesmo arquivo de leitura

%%
% Inicialização de Variáveis
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

SinaisEEG = LeituraArquivo(Eletrodos,TestNumber);
SinaisEEG = CorteNoTempo(SinaisEEG,T,to,td,fs,NumAtividades,NumTestes);
Sinais = PreProcessamento(SinaisEEG,Num,Den);
[SinaisPSD,f] = CalculaPSD(Sinais,blackman(128),64,200);
[SinaisPSD,f] = CorteEmFrequencia(SinaisPSD,f,fo,ff);
SinaisConcPSD = ConcatenaPSDs(SinaisPSD);
PSD = SeparaPorAtividade(SinaisConcPSD,Atividades,TestNumber);

%%
% Plotagens
%%%%%%%%%%%%%
if numel(Color) ~= 0
    
    if First == true                                    %Prepara os gráficos
        figure
        y_tracejado = (0:0.05:3)*1e2;
        for i=1 : 8                                     %8 Ativida => 8 Gráficos

            subplot(2,4,i),hold,title(Atividades(i,:)),axis([0 140 0 max(y_tracejado)])

            for k=1 : 4                                 %4 tracejados em cada gráfico
               x_tracejado = (28*k)*ones(1,length(y_tracejado));
               plot(x_tracejado,y_tracejado,'r--')
            end

        end
    end
        
    for i=1 : NumAtividades
        for k=1 : NumTestes
            subplot(2,4,i),plot(PSD(k,:,i)/1000,Color)
        end
    end
    
end







