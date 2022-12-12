clear all
%close all
clc

Atividades = ['BDIR'; 'BESQ'; 'NADA'; 'PBOA'; 'PMLE'; 'PQRI'; 'PDIR'; 'PESQ'];
[NumAtividades, NumLetras] = size(Atividades);

TotalIteracoes = nchoosek(NumAtividades,2); %Combinação de NumAtividades, tomados 2 a 2.
iteracao = 0;
for i=1 : NumAtividades-1 % Combinação 2 a 2
    for j=i+1 : NumAtividades % ^
        iteracao = iteracao + 1;
        disp(cat(2,num2str( 100*(iteracao-1)/TotalIteracoes ),'%'))
        correlacao(:,iteracao) = EEGcompOutra( Atividades(i,:),Atividades(j,:),false );
        Rotulos(iteracao,:) = cat(2,Atividades(i,:),' x ',Atividades(j,:));
        clc
    end
end
disp('100%')
figure,boxplot(correlacao,'Orientation','Horizontal','Labels',Rotulos)%,'labelorientation','inline')