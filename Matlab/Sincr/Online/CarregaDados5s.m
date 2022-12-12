load('PSD_1_5s_01.mat'); load('PSD_2_5s_01.mat'); load('PSD_3_5s_01.mat'); 
load('PSD_1_5s_02.mat'); load('PSD_2_5s_02.mat'); load('PSD_3_5s_02.mat'); 
load('PSD_1_5s_03.mat'); load('PSD_2_5s_03.mat'); load('PSD_3_5s_03.mat');

PSD_1 = [PSD_1_5s_01; PSD_1_5s_02; PSD_1_5s_03];
PSD_2 = [PSD_2_5s_01; PSD_2_5s_02; PSD_2_5s_03];
PSD_3 = [PSD_3_5s_01; PSD_3_5s_02; PSD_3_5s_03];
clear PSD_1_5s_01, clear PSD_2_5s_01, clear PSD_3_5s_01
clear PSD_1_5s_02, clear PSD_2_5s_02, clear PSD_3_5s_02
clear PSD_1_5s_03, clear PSD_2_5s_03, clear PSD_3_5s_03

PSD_1 = PSD_1(max(PSD_1,[],2)>limite,:);
PSD_2 = PSD_2(max(PSD_2,[],2)>limite,:);
PSD_3 = PSD_3(max(PSD_3,[],2)>limite,:);

PSD_data = [PSD_1; PSD_2; PSD_3];

figure
subplot(1,3,1), plot(PSD_1'),title('BESQ'),ylim([0 25]*1e5)
subplot(1,3,2), plot(PSD_2'),title('NADA'),ylim([0 25]*1e5)
subplot(1,3,3), plot(PSD_3'),title('PDIR'),ylim([0 25]*1e5)

PSD_1 = mean(PSD_1);
PSD_2 = mean(PSD_2);
PSD_3 = mean(PSD_3);

figure, hold
plot(PSD_1,'r'), plot(PSD_2,'g'), plot(PSD_3,'b')
legend('BESQ','NADA','PDIR')
