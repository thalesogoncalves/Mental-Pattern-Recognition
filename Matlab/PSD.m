function [SigPSD,f] = fcn(Signals,window,noverlap,fs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Fun��o que realiza os c�lculo da densidade espectral de
%  pot�ncia dos sinais. Realiza o c�lculo da energia dos
%  sinais com janelas de 40 amostras.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% C�lculo de Energia
%%%%%%%%%%%%%%%%%%%%%

[SigQtdd, samples] = size(Signals);
for i = 1 : SigQtdd
    for j = 1 : samples-40
        SigEnergy(i,j) = sum(Signals(i,j:j+39).^2);
    end
end
%EC3(end+40) = 0;
%EC4(end+40) = 0;

%%
% Densidade Espectral de Pot�ncia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1 : SigQtdd
   [aux(:,i),f] = pwelch(SigEnergy(i,:),window,noverlap,[],fs);
end
SigPSD = aux';
f = f';



