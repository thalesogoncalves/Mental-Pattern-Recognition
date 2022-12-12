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

[SigQtdd, samples, ElecQtdd] = size(Signals);
for i = 1 : SigQtdd
    for j = 1 : ElecQtdd
        [aux,f] = pwelch(Signals(i,:,j),window,noverlap,[],fs);
        SigPSD(i,:,j) = aux';
    end
end
f = f';

%%
% Cálculo de Energia
%%%%%%%%%%%%%%%%%%%%%

SigPSD = SigPSD.^2;

