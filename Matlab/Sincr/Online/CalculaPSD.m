function [SigPSD,f] = fcn(Signals,window,noverlap,fs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Fun��o que realiza os c�lculo da densidade espectral de
%  pot�ncia dos sinais. Realiza o c�lculo da energia dos
%  sinais ap�s a PSD.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Densidade Espectral de Pot�ncia (PSD)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ElecQtdd, samples] = size(Signals);
for i = 1 : ElecQtdd
    [aux,f] = pwelch(Signals(i,:),window,noverlap,[],fs);
    SigPSD(i,:) = aux';
end
    
f = f';

%%
% C�lculo de Energia
%%%%%%%%%%%%%%%%%%%%%

SigPSD = SigPSD.^2;

