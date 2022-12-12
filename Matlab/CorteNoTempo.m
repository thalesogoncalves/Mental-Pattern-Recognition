function [CutSignals] = fcn(Signals,to,td,fs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Função que corta um sinal no tempo, devolvendo a janela 
%  desejada. Espera-se que os tempos inicial (to) e de
%  duração (td) sejam referenciados em segundos (s).
%  Espera-se que a frequência de amostragem fs seja
%  referenciada em Hertz (Hz). Ex:
%
%  Signals =
%
%  0 1 5 6 9 1 9 7 3 9 4 2 7 1 2 8 9 3 7 1 2 4 ...
%      |     |     |     |     |     |     |   ...
%     1s    2s    3s    4s    5s    6s    7s   ...
%
%  to = 2s , td = 3s
%
%  CutSignals =
%
%  1 9 7 3 9 4 2 7 1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Corte dos dados no tempo
%%%%%%%%%%%%%%%%%%%%%%%%%%%

[SigQtdd, samples] = size(Signals);
tf = to + td;

for i = 1 : SigQtdd
    CutSignals(i,:) = Signals(i, to*fs : tf*fs-1);
end


