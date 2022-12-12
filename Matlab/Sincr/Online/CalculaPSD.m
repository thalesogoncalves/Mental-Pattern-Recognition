function [SigPSD,f] = fcn(Signals,window,noverlap,fs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Função que realiza os cálculo da densidade espectral de
%  potência dos sinais. Realiza o cálculo da energia dos
%  sinais após a PSD.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Densidade Espectral de Potência (PSD)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ElecQtdd, samples] = size(Signals);
for i = 1 : ElecQtdd
    [aux,f] = pwelch(Signals(i,:),window,noverlap,[],fs);
    SigPSD(i,:) = aux';
end
    
f = f';

%%
% Cálculo de Energia
%%%%%%%%%%%%%%%%%%%%%

SigPSD = SigPSD.^2;

