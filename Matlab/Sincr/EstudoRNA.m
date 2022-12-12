load net97p4n.mat
acertos = 0;
erros = 0;
for i=1 : 36
    output = sim(net,RNA_input(i,:)')';
    
    output( output==max(output) ) = 1;
    output( output~=1 ) = 0;
    
    output = 1*output(1) + 2*output(2) + 3*output(3);
    target = 1*RNA_target(i,1) + 2*RNA_target(i,2) + 3*RNA_target(i,3);
        
    if output == target
        acertos = acertos + 1;
    else
        erros = erros + 1;
        figure,plot(RNA_input(i,:)),title(cat(2,'TARGET: ',num2str(target),' / OUTPUT: ',num2str(output)))
    end
end

disp( cat(2,'Porcentagem de acerto: ',num2str(100*acertos/(acertos+erros)),'%'))