function [CutSignals,Cutf] = fcn(SigSpec,f,fo,ff)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Função que corta um sinal em frequência, devolvendo a
%  janela desejada. Espera-se que as frequências inicial
%  (fo) e final (ff) sejam referenciados Hertz (Hz).
%  Espera-se que o vetor de frequências (f) tenha o mesmo
%  tamanho do espectro do sinal SigSpec
%
%  SigSpec =
%
%  0 1 5 6 9 1 9 7 3 9 4 2 7 1 2 8 9 3 7 1 2 4  ...
%  |     |     |     |     |     |     |     |  ...
% 0Hz   1Hz   2Hz   3Hz   4Hz   5Hz   6Hz   7Hz ...
%
%  fo = 2Hz , ff = 5Hz
%
%  CutSignals =
%
%  1 9 7 3 9 4 2 7 1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Cortes dos dados em frequência
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ElecQtdd,samples] = size(SigSpec);

for i = 1 : ElecQtdd
    CutSignals(i,:) = SigSpec(i,f>fo & f<ff);
end
Cutf = f(f>fo & f<ff);



