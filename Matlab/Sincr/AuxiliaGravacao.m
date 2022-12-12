tic, clc, disp 'Comece a gravação em 5...'
clear all
close all

NumTestes = 6;

Atividades = ['BDIR'; 'BESQ'; 'NADA'; 'PMLE'; 'PQRI'; 'PBOA'; 'PDIR'; 'PESQ'];
[TotalAtividades,TotalLetras] = size(Atividades);

QtddAtividades = zeros(1,TotalAtividades);

for k = 1 : 10000/20 %10000 = fs, 1/20 = tempo que o som toca
    som1(k) = sin(2*pi*2000 * k/10000);
    som2(k) = sin(2*pi*1500 * k/10000);
end
objsom = audioplayer(som1+som2,10000);

for k = 4 : -1 : 1
    while toc<1, end
    tic, clc, disp(cat(2,'Comece a gravação em ',num2str(k),'...'))
end

while toc<1, end
tic, clc, play(objsom), disp 'X'

for k = 1 : NumTestes*TotalAtividades
    
    i = randi(8,1,1);
    while QtddAtividades(i) == NumTestes
        i=i+1;
        if i>8, i=i-8; end
    end
    QtddAtividades(i) = 1+QtddAtividades(i);
    HistoricoAtividade(k,:) = Atividades(i,:);
    
    
    while toc<1, end
    tic, clc, disp(HistoricoAtividade(k,:))
    
    while toc<3, end
    tic, clc, soundsc(som1,10000)
    
    while toc<5, end
    tic, clc, soundsc(som2,10000), disp 'X'
    
    while toc<1, end
    tic
    
end

clc
clear Atividades, clear NumTestes, clear QtddAtividades
clear TotalAtividades, clear TotalLetras
clear i, clear k, clear objsom, clear som1, clear som2

save( input('Qual o nome do arquivo a ser salvo com o Historico de Atividades?\n'))

clear HistoricoAtividade









