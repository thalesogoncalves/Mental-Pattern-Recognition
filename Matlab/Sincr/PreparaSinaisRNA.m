AtividadesEscolhidas = ['BESQ'; 'NADA'; 'PDIR'];

[NumAtividadesEscolhidas NumCaracteres] = size(AtividadesEscolhidas);
[NumTestes NumAmostras NumAtividades] = size(PSD);

% NORMALIZA PSD %
for i=1 : NumAtividades
    PSD(:,:,i) = PSD(:,:,i)/max(max(PSD(:,:,i)));
end

RNA_input_naomix = [];
RNA_target_naomix = zeros(NumTestes * NumAtividadesEscolhidas, NumAtividadesEscolhidas);
for i=1 : NumAtividadesEscolhidas
    switch AtividadesEscolhidas(i,:)
        case 'BDIR'
            RNA_input_naomix = cat(1,RNA_input_naomix,PSD(:,:,1));
        case 'BESQ'
            RNA_input_naomix = cat(1,RNA_input_naomix,PSD(:,:,2));
        case 'NADA'
            RNA_input_naomix = cat(1,RNA_input_naomix,PSD(:,:,3));
        case 'PMLE'
            RNA_input_naomix = cat(1,RNA_input_naomix,PSD(:,:,4));
        case 'PQRI'
            RNA_input_naomix = cat(1,RNA_input_naomix,PSD(:,:,5));
        case 'PBOA'
            RNA_input_naomix = cat(1,RNA_input_naomix,PSD(:,:,6));
        case 'PDIR'
            RNA_input_naomix = cat(1,RNA_input_naomix,PSD(:,:,7));
        case 'PESQ'
            RNA_input_naomix = cat(1,RNA_input_naomix,PSD(:,:,8));
    end
    RNA_target_naomix(NumTestes*(i-1)+(1:NumTestes),i) = ones(1:NumTestes,1);
end
[NumSamples NumPadroes] = size(RNA_target_naomix);

RNA_input = zeros(NumSamples,NumAmostras);
RNA_target = zeros(NumSamples,NumPadroes);
LinhasJaEscolhidas = zeros(1,NumSamples);
for i = 1 : NumSamples
    
    n = randi(NumSamples,1,1);
    while LinhasJaEscolhidas(n) == 1
        n=n+1;
        if n>NumSamples, n=n-NumSamples; end
    end
    
    LinhasJaEscolhidas(n) = 1;
    RNA_input(i,:) = RNA_input_naomix(n,:);
    RNA_target(i,:) = RNA_target_naomix(n,:);

end

% CORTA O SINAL PARA EXISTIR APENAS NOS DOIS ÚLTIMOS ELETRODOS %
%RNA_input = RNA_input(:,3*28+1:end);

figure,
for i=1 : NumPadroes
    subplot(1,3,i),hold,title(AtividadesEscolhidas(i,:))
end
for i=1 : NumSamples
    NumeroDoPadrao = 1*RNA_target(i,1) + 2*RNA_target(i,2) + 3*RNA_target(i,3); 
    subplot(1,3,NumeroDoPadrao),plot(RNA_input(i,:))
end






















