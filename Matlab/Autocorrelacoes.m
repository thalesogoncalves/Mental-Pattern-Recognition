clear all
%close all
clc

Atividades = ['BDIR'; 'BESQ'; 'NADA'; 'PBOA'; 'PMLE'; 'PQRI'; 'PDIR'; 'PESQ'];
[NumAtividades, NumLetras] = size(Atividades);

for i=1 : NumAtividades
    disp(cat(2,num2str( 100*(i-1)/NumAtividades ),'%'))
    Autocorrelacao(:,i) = EEGcompMesma(Atividades(i,:),false);
    clc
end
disp('100%')
figure,boxplot(Autocorrelacao,'Orientation','Horizontal','Labels',Atividades)
