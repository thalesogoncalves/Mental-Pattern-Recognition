%function correlacao = fcn(Sigla,Color)
Color = 'k';
TOTAL_ARQUIVOS = 2;
PSD = 0;

size(PSD)
for i=1 : TOTAL_ARQUIVOS
    
    aux = eeg(i,Color, i==1 );
    if PSD == 0
        PSD = aux;
    else
        PSD = cat(1,PSD, aux);
    end
    size(PSD)
end
    
    

% [NumeroTestes, Amostras] = size(PSD);
% 
% 
% iteracao = 0;
% for j = 1 : NumeroTestes-1 %Correlação 2 a 2
%     for k = j+1 : NumeroTestes % ^
%         iteracao = iteracao + 1;
%         aux = corrcoef( PSD(j,:),PSD(k,:) );
%         correlacao(iteracao) = aux(2); %Importa apenas a segunda posição da matriz retornada pela função 'corrcoef'.
%     end
% end
