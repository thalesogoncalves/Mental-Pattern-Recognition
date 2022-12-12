clear all, close all, clc

limite = -1;
CarregaDados5s
k=0;
for i=1 : 30
    
    figure
    for j=1 : 18
        
        k=k+1;
        subplot(3,6,j),plot(PSD_data(k,:)),ylim([0 3]*1e6), title(k)
        
    end
end
    
Classe_data(1:180,1) = ones(180,1);
Classe_data(181:360,2) = ones(180,1);
Classe_data(361:540,3) = ones(180,1);

limite = 3e5;
Classe_data = Classe_data(max(PSD_data,[],2)>limite,:);
PSD_data = PSD_data(max(PSD_data,[],2)>limite,:);

[coeff, score, latent, tsquared, explained] = pca(PSD_data);
clear latent, clear tsquared

coeff = coeff(:,1:10);
score = score(:,1:10);

pca1 = score(Classe_data(:,1)==1,:);
pca2 = score(Classe_data(:,2)==1,:);
pca3 = score(Classe_data(:,3)==1,:);

for i=1:305
    
    alvo(i) = 1*Classe_data(i,1)+2*Classe_data(i,2)+3*Classe_data(i,3);
    
    dif1 = sum(abs( score(i,:) - mean(pca1) ));
    dif2 = sum(abs( score(i,:) - mean(pca2) ));
    dif3 = sum(abs( score(i,:) - mean(pca3) ));
    
    [junk, Classe(i)] = min([dif1 dif2 dif3]);
        
end

disp( cat(2,num2str(100*sum(alvo==Classe)/305),'%') )

[RNA_input RNA_target] = MisturaSinaisRNA(score,Classe_data);











