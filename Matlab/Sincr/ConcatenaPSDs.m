function [PSDconc] = fcn(PSD)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Função que concatena as PSDs de diferentes eletrodos de
%  um mesmo sinal.
%  Exemplo:
%
% Sinal1:
%       C3               C4
%  ------------     ------------
%  | o        |     |          |
%  | | o   o  |     | o o   o  |
%  | | | o |  |     | | | o |  |
%  ------------     ------------
%
% Sinal2:
%       C3               C4
%  ------------     ------------
%  | o o   o  |     |       o  |
%  | | |   |  |     |   o   |  |
%  | | | o |  |     | o | o |  |
%  ------------     ------------
%
% Gera:
%
% Sinal:
%  --------------------
%  | o                |
%  | | o   o o o   o  |
%  | | | o | | | o |  |
%  --------------------
%  --------------------
%  | o o   o       o  |
%  | | |   |   o   |  |
%  | | | o | o | o |  |
%  --------------------
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Concatena PSDs
%%%%%%%%%%%%%%%%%%

[SigQtdd, samples, ElecQtdd] = size(PSD);

for i = 1 : SigQtdd %Concatena as PSDs dos diferentes eletrodos de um mesmo sinal.
    LinhaAtual = PSD(i,:,1);
    for j = 2 : ElecQtdd
        LinhaAtual = cat(2,LinhaAtual,PSD(i,:,j));
    end
    PSDconc(i,:) = LinhaAtual;
end
