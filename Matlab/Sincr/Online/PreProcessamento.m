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

[ElecQtdd, samples] = size(Signals);
for i = 1 : ElecQtdd
    Signals(i,:) = Signals(i,:) - mean( Signals(i,:) );
end

%%
% Filtragem Espacial (CAR)
%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cref = mean(Signals);
for i = 1 : ElecQtdd
    Signals(i,:) = Signals(i,:) - Cref;
end

%%
% Filtragem Temporal
%%%%%%%%%%%%%%%%%%%%%

for i = 1 : ElecQtdd
    PreProcessedSignals(i,:) = filter(FiltNum,FiltDen,Signals(i,:));
end


