function [SigPSD,f] = fcn(Signals,window,noverlap,fs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Função que realiza os cálculo da densidade espectral de
%  potência dos sinais. Realiza o cálculo da energia dos
%  sinais com janelas de 40 amostras.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Cálculo de Energia
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
% Densidade Espectral de Potência
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1 : SigQtdd
   [aux(:,i),f] = pwelch(SigEnergy(i,:),window,noverlap,[],fs);
end
SigPSD = aux';
f = f';



