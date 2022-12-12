function [Signals] = fcn(Electrodes)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Função que lê o arquivo File no diretório e retorna os 
%  sinais contidos nos eletrodos Electrodes. Espera-se que
%  essa variável seja coluna de strings. Ex:
%  Electrodes = C3
%               C4
%               Cz
%
%  Retorna os sinais em diferentes linhas, ao longo das
%  colunas. Ex:
%  Signals = 0 1 2 3 4 5 ... [referente a C3]
%            1 1 1 4 1 1 ... [referente a C4]
%            0 0 0 0 0 2 ... [referente a Cz]
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
% Encontra colunas
%%%%%%%%%%%%%%%%%%%%

Elec2 = ['F7';'T3';'T5';'xx';'F3';'C3';'P3';'O1';'F8';'T4';'T6';'xx';'F4';'C4';'P4';'O2';'Fz';'Cz';'Pz';'Oz';'A1';'A2'];
Elec3 = ['xxx';'xxx';'xxx';'Fp1';'xxx';'xxx';'xxx';'xxx';'xxx';'xxx';'xxx';'Fp2'];

[ElecQtdd,Chars] = size(Electrodes);
[Elec2Qtdd,aux] = size(Elec2);
[Elec3Qtdd,aux] = size(Elec3);
clear aux

if Chars == 2
    for i = 1 : ElecQtdd
        if Electrodes(i,:) ~= 'xx'
            for j = 1 : Elec2Qtdd
                if Electrodes(i,:) == Elec2(j,:)
                    coluna(i) = j;
                end
            end
        end
    end
elseif Chars == 3
    for i = 1 : ElecQtdd
        if Electrodes(i,:) ~= 'xxx'
            for j = 1 : Elec3Qtdd
                if Electrodes(i,:) == Elec3(j,:)
                    coluna(i) = j;
                end
            end
        end
    end
end

%%
% Carrega os dados
%%%%%%%%%%%%%%%%%%%%

data = load(cat(2,'C:\Users\Thales\Google Drive\Engenharia\TCC\Matlab\Sincr\Online\simo\Arquivo1.txt'));
for i = 1 : ElecQtdd
    Signals(i,:) = data(:,coluna(i))';
end




