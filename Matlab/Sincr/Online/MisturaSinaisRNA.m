function [RNA_input, RNA_target] = fcn(PSD_data, Class_data)

AtividadesEscolhidas = ['BESQ'; 'NADA'; 'PDIR'];

[NumAtividadesEscolhidas NumCaracteres] = size(AtividadesEscolhidas);
[NumTestes NumAmostras] = size(PSD_data);

RNA_input = zeros(NumTestes,NumAmostras);
RNA_target = zeros(NumTestes,NumAtividadesEscolhidas);
LinhasJaEscolhidas = zeros(1,NumTestes);

for i = 1 : NumTestes
    
    n = randi(NumTestes,1,1);
    while LinhasJaEscolhidas(n) == 1
        n=n+1;
        if n>NumTestes, n=n-NumTestes; end
    end
    
    LinhasJaEscolhidas(n) = 1;
    RNA_input(i,:) = PSD_data(n,:);
    RNA_target(i,:) = Class_data(n,:);

end






















