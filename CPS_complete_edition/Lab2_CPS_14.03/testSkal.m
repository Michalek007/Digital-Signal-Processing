clc; clear; close all;

dt = 0.0001;
t = 0:dt:1;


bH1 = xpi((t-1/2)/1);
bH2 = xpi((t-1/4)/(1/2))-xpi((t-1/4-0.5)/(1/2));
bH3 = sqrt(2)*xpi((t-1/8)/(1/4))-sqrt(2)*xpi((t-1/8-0.5/2)/(1/4));
bH4 = sqrt(2)*xpi((t-1/8-0.5)/(1/4))-sqrt(2)*xpi((t-1/8-0.5/2-0.5)/(1/4));

figure(1)
subplot(4,1,1);
plot(t,bH1);
subplot(4,1,2);
plot(t,bH2);
subplot(4,1,3);
plot(t,bH3);
subplot(4,1,4);
plot(t,bH4);

il1_1 = ilSkal(bH1,bH1,dt);
il1_2 = ilSkal(bH1,bH2,dt);
il1_3 = ilSkal(bH1,bH3,dt);
il1_4 = ilSkal(bH1,bH4,dt);
il2_1 = ilSkal(bH2,bH1,dt);
il2_2 = ilSkal(bH2,bH2,dt);
il2_3 = ilSkal(bH2,bH3,dt);
il2_4 = ilSkal(bH2,bH4,dt);
il3_1 = ilSkal(bH3,bH1,dt);
il3_2 = ilSkal(bH3,bH2,dt);
il3_3 = ilSkal(bH3,bH3,dt);
il3_4 = ilSkal(bH3,bH4,dt);
il4_1 = ilSkal(bH4,bH1,dt);
il4_2 = ilSkal(bH4,bH2,dt);
il4_3 = ilSkal(bH4,bH3,dt);
il4_4 = ilSkal(bH4,bH4,dt);

res = [il1_1,il1_2,il1_3,il1_4;il2_1,il2_2,il2_3,il2_4;il3_1,il3_2,il3_3,il3_4;il4_1,il4_2,il4_3,il4_4;]