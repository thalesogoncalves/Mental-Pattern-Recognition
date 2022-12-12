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

[ElecQtdd, samples] = size(PSD);

PSDconc = PSD(1,:);
for i = 2 : ElecQtdd
    PSDconc = cat(2,PSDconc,PSD(i,:));
end
    
