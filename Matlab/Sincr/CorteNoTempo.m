function [CutSignals] = fcn(Signals,T,to,td,fs,NumAtividades,NumTestes)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Função que corta um sinal no tempo, devolvendo janelas 
%  desejadas periodicamente. Espera-se que os tempos
%  inicial (to), de duração (td) e o Período (T) sejam
%  referenciados em segundos (s).
%  Espera-se que a frequência de amostragem fs seja
%  referenciada em Hertz (Hz). Ex:
%
%  Signals =
%
%  0 1 5 6 9 1 9 7 3 9 4 2 7 1 2 8 9 3 7 1 2 4 ...
%      |     |     |     |     |     |     |   ...
%     1s    2s    3s    4s    5s    6s    7s   ...
%
%  to = 1s , td = 1s, T = 3s
%
%  CutSignals =
%
%  5 6 9
%  2 7 1
%  . . .
%
%
%  Como a variável Signals possui os eletrodos em suas
%  linhas e as amostras em suas colunas (
%
%  Signals =
%
%     C3     1 9 2 4 2 5 3 9 2 ...
%     C4     6 2 2 4 1 7 6 5 3 ...
%     F3     9 9 2 0 4 2 4 8 1 ...
%     . . .
%
%  ), então CutSignals retorna uma matriz 3D, sendo:
%
%  linhas - os NumAtividades*NumTestes sinais
%  colunas - as amostras
%  alturas - os eletrodos
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Corte dos dados no tempo
%%%%%%%%%%%%%%%%%%%%%%%%%%%

[NumEletrodos, samples] = size(Signals);
tf = to + td;

for i=1 : NumEletrodos
    for j=1 : NumAtividades*NumTestes
        CutSignals(j,:,i) = Signals(i, 1+(T*(j-1) + to)*fs : (T*(j-1) + tf)*fs );
    end
end



