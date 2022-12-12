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

Comp = zeros(Total_Testes^2 , nchoosek(NumAtividades,2));
% A matriz correlação possui o quadrado do total de testes
% de linhas e a combinação do número de atividades tomadas
% 2 a 2 de colunas.

combinacao_atividades = 0;
for i = 1 : NumAtividades-1 %Combinação 2 a 2 das atividades
    for j = i+1 : NumAtividades % ^
        combinacao_atividades = combinacao_atividades+1;
        
        iteracao = 0;
        for k = 1 : Total_Testes %Correlação 2 a 2
            for l = 1 : Total_Testes
                iteracao = iteracao + 1;
                aux = corrcoef( PSD(k,:,i) , PSD(l,:,j) );
                Comp(iteracao,combinacao_atividades) = aux(2); %Importa apenas a segunda posição da matriz retornada pela função 'corrcoef'.
                %Comp(iteracao,combinacao_atividades) = sum(abs( PSD(k,:,i).*PSD(l,:,j) ));
            end
        end
        
        Rotulos(combinacao_atividades,:) = cat(2, Atividades(i,:),' x ',Atividades(j,:),' ');
        
    end
end

figure,boxplot(Comp/max(max(Comp)),'Orientation','Horizontal','Labels',Rotulos)

Medias = mean(Comp)';
Medias = Medias/max(Medias);

[Rotulos num2str(Medias)]

PreparaSinaisRNA







