function [PreProcessedSignals] = fcn(Signals,FiltNum,FiltDen)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Função que realiza os seguintes pré-processamentos nos
%  sinais:
%  - Cancelamento da componente de 0 Hz
%  - Filtragem Espacial (CAR)
%  - Filtragem Temporal
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Retira componente de 0 Hz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[SigQtdd, samples, ElecQtdd] = size(Signals);
for i = 1 : SigQtdd
    for j = 1 : ElecQtdd
        Signals(i,:,j) = Signals(i,:,j) - mean( Signals(i,:,j) );
    end
end

%%
% Filtragem Espacial (CAR)
%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cref = mean(Signals,3); %Sinais que ocorrem no mesmo tempo, em eletrodos diferentes compartilham a >terceira< dimensão da matriz
for i = 1 : SigQtdd
    for j = 1 : ElecQtdd
        Signals(i,:,j) = Signals(i,:,j) - Cref(i,:);
    end
end

%%
% Filtragem Temporal
%%%%%%%%%%%%%%%%%%%%%

for i = 1 : SigQtdd
    for j = 1 : ElecQtdd
        PreProcessedSignals(i,:,j) = filter(FiltNum,FiltDen,Signals(i,:,j));
    end
end


