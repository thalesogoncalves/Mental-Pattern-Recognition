clear all
close all
clc

Color = 'k';
TOTAL_ARQUIVOS = 2;


Atividades = ['BDIR'; 'BESQ'; 'NADA'; 'PMLE'; 'PQRI'; 'PBOA'; 'PDIR'; 'PESQ'];
PSD = 0;
for i=1 : TOTAL_ARQUIVOS
    
    aux = eeg(i,Color, i==1 );
    if PSD == 0
        PSD = aux;
    else
        PSD = cat(1,PSD, aux);
    end

end


[Total_Testes, Amostras, NumAtividades] = size(PSD);

Diff = zeros(nchoosek(Total_Testes,2) , NumAtividades);
% A matriz correlação possui Combinação (nchoosek) do total de testes
% tomados 2 a 2 de linhas e o número de atividades de colunas.

for i = 1 : NumAtividades %Fixar a atividade para o cálculo da correlação
    PSD(:,:,i) = PSD(:,:,i)/max(max(PSD(:,:,i)));
    iteracao = 0;
    for j = 1 : Total_Testes-1 %Correlação 2 a 2
        for k = j+1 : Total_Testes % ^
            iteracao = iteracao + 1;
            %aux = corrcoef( PSD(j,:,i) , PSD(k,:,i) );
            %correlacao(iteracao,i) = aux(2); %Importa apenas a segunda posição da matriz retornada pela função 'corrcoef'.
            Diff(iteracao,i) = sum(abs( PSD(j,:,i).*PSD(k,:,i) ));
        end
    end
end

Diff = Diff/max(max(Diff));
figure,boxplot(Diff,'Orientation','Horizontal','Labels',Atividades)
















