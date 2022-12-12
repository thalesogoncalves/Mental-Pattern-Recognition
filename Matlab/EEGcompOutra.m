function correlacao = fcn(Sigla1,Sigla2,graf)

NumeroTestes = 7;
Siglas = [Sigla1; Sigla2];

for pos = 1 : 2
    
    switch Siglas(pos,:)
        case 'BDIR'
            Atividade = 'BracoDireito';
        case 'BESQ'
            Atividade = 'BracoEsquerdo';
        case 'NADA'
            Atividade = 'Nada';
        case 'PBOA'
            Atividade = 'PalavrasBoas';
        case 'PMLE'
            Atividade = 'PalavrasMesmaLetra';
        case 'PQRI'
            Atividade = 'PalavrasQueRimam';
        case 'PDIR'
            Atividade = 'PernaDireita';
        case 'PESQ'
            Atividade = 'PernaEsquerda';
    end

    if graf == true
        if pos == 1
            for j = 1 : NumeroTestes
                PSD(j,:,pos) = eeg(Atividade,j,'b',j==1);
            end
        else
            for j = 1 : NumeroTestes
                PSD(j,:,pos) = eeg(Atividade,j,'r',0);
            end
        end
    else
        for j = 1 : NumeroTestes
            PSD(j,:,pos) = eeg(Atividade,j,[],j==1);
        end
    end
end


[NumeroTestes, Amostras, NumeroAtividades] = size(PSD);


iteracao = 0;
for j = 1 : NumeroTestes %Correlação 2 a 2
    for k = 1 : NumeroTestes % ^
        iteracao = iteracao + 1;
        aux = corrcoef( PSD(j,:,1),PSD(k,:,2) ); % O j-ésimo sinal da atividade 1 com o k-ésimo sinal da atividade 2
        correlacao(iteracao) = aux(2); %Importa apenas a segunda posição da matriz retornada pela função 'corrcoef'.
    end
end
