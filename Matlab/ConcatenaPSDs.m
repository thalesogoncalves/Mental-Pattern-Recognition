function [PSDconc] = fcn(PSD)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Função que concatena as PSDs de diferentes eletrodos de
%  um mesmo teste.
%  Exemplo:
%
% Teste1:
%       C3               C4
%  ------------     ------------
%  | o        |     |          |
%  | | o   o  |     | o o   o  |
%  | | | o |  |     | | | o |  |
%  ------------     ------------
%
% Teste2:
%       C3               C4
%  ------------     ------------
%  | o o   o  |     |       o  |
%  | | |   |  |     |   o   |  |
%  | | | o |  |     | o | o |  |
%  ------------     ------------
%
% Gera:
%
% Teste:
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

[NumeroEletrodos, Amostras, NumeroTestes] = size(PSD);    

for k = 1 : NumeroTestes %Concatena as PSDs dos diferentes eletrodos de um mesmo teste.
    LinhaAtual = PSD(1,:,k);
    for i = 2 : NumeroEletrodos
        Tamanho = length(LinhaAtual);
        LinhaAtual( Tamanho+(1:Amostras) ) = PSD(i,:,k);
    end
    PSDconc(k,:) = LinhaAtual;
end
