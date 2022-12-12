function PSD = fcn(SinaisConcPSD, Atividades, TestNumber)

%%
% Separação da PSD em Diferentes Atividades
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Atividades = ['BDIR'; 'BESQ'; 'NADA'; 'PMLE'; 'PQRI'; 'PBOA'; 'PDIR'; 'PESQ']; %Atividades Possíveis.
[NumAtividades, NumLetras] = size(Atividades);

[NumPSDs, AmostrasConc] = size(SinaisConcPSD);
NumTestes = NumPSDs/NumAtividades;

load( cat(2,'C:\Users\thalesogoncalves\Google Drive\Engenharia\TCC\Matlab\Sincr\Base de Dados\',num2str(TestNumber),'.mat') )


PSD = zeros(NumTestes,AmostrasConc,NumAtividades);
for i=1 : NumPSDs
    
        AtividadeID=1;
        while true
            if Atividades(AtividadeID,:) == HistoricoAtividade(i,:)
                break;
            end
            AtividadeID = AtividadeID+1;
        end
        
        TesteID=1;
        while true
            if PSD(TesteID,:,AtividadeID) == 0
                PSD(TesteID,:,AtividadeID) = SinaisConcPSD(i,:);
                break;
            end
            TesteID = TesteID+1;
        end
        
end
