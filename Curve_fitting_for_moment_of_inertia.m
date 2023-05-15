clc
clear all
close all
%% Inputs

T = xlsread('Literature review.xlsx',5,'B3:C354'); % importing Excel data
X1 = T(:,1);     % length of one half of auxetic 
I1 = T(:,2);     % Moment of inertia of one half of auxetic
I2 = zeros(351,1);  % Moment of inertia of second half of auxetic
X2 = zeros(351,1);  % length of second half of auxetic

for i = 1:351
    I2(i) = I1(352-i);
    X2(i) = 17.55 + X1(i+1);
end

X_aux = [X1;X2]; % Length of auxetic part
I_aux = [I1;I2]; % Moment of inertia of auxetic part

X_aux = 2+X_aux;
X3 = (0:0.05:1.95)';
X4 = (37.1:0.05:80)';
X = [X3;X_aux;X4];

I3 = (8*35/12)*ones(40,1);
I4 = (8*35/12)*ones(859,1);
I = [I3;I_aux;I4];
XI = [X I];
tic
figure(1)
plot(X,I)
xlabel('Length of the Hexachiral beam (mm)');
ylabel('Moment of inertia (mm^4)')
toc

%% Case - 1: x = 0 to x = 2

x1 = X(1:41);
i1 = I(1:41);
M1 = zeros(length(x1),1);
for i = 1:length(x1)
    M1(i) = (35*8)/12; 
end

%% Case - 2: x = 2.05 to x = 2.4

x2 = X(42:49);
i2 = I(42:49);
[p2,s2,mu2] = polyfit(x2,i2,5);
M2 = polyval(p2,x2,[],mu2);
T2 = table(x2,i2,M2);
T2.Error  = (T2.i2- T2.M2).*(100./T2.i2); % Percentage error

k2 = 2.05:0.005:2.4;
m2all = polyval(p2,k2,[],mu2);
% figure(2)
% plot(k2,m2all)
% hold on
% plot(x2,i2,'o')
% legend('Fitted curve','Actual curve')

%% Case - 3: x = 2.4 to x = 2.65

x3 = X(49:54);
i3 = I(49:54);
i3(1) = M2(end);
[p3,s3,mu3] = polyfit(x3,i3,3);
M3 = polyval(p3,x3,[],mu3);
T3 = table(x3,i3,M3);
T3.Error  = (T3.i3 - T3.M3).*(100./T3.i3); % Percentage error

k3 = 2.4:0.005:2.65;
m3all = polyval(p3,k3,[],mu3);
% figure(3)
% plot(k3,m3all)
% hold on
% plot(x3,i3,'o')
% legend('Fitted curve','Actual curve')

%% Case - 4: x = 2.65 to x = 7.2

x4 = X(54:145);
i4 = I(54:145);
i4(1) = M3(end);
[p4,s4,mu4] = polyfit(x4,i4,8);
M4 = polyval(p4,x4,[],mu4);
T4 = table(x4,i4,M4);
T4.Error  = (T4.i4 - T4.M4).*(100./T4.i4); % Percentage error

k4 = 2.65:0.005:7.2;
m4all = polyval(p4,k4,[],mu4);
% figure(4)
% plot(k4,m4all)
% hold on
% plot(x4,i4,'o')
% legend('Fitted curve','Actual curve')

%% Case - 5: x = 7.2 to x = 7.45

x5 = X(145:150);
i5 = I(145:150);
i5(1) = M4(end);
[p5,s5,mu5] = polyfit(x5,i5,3);
M5 = polyval(p5,x5,[],mu5);
T5 = table(x5,i5,M5);
T5.Error  = (T5.i5 - T5.M5).*(100./T5.i5); % Percentage error

k5 = 7.2:0.005:7.45;
m5all = polyval(p5,k5,[],mu5);
% figure(5)
% plot(k5,m5all)
% hold on
% plot(x5,i5,'o')
% legend('Fitted curve','Actual curve')

%% Case - 6: x = 7.45 to x = 7.8

x6 = X(150:157);
i6 = I(150:157);
i6(1) = M5(end);
i6(end) = 3.85;
[p6,s6,mu6] = polyfit(x6,i6,3);
M6 = polyval(p6,x6,[],mu6);
T6 = table(x6,i6,M6);
T6.Error  = (T6.i6 - T6.M6).*(100./T6.i6); % Percentage error

k6 = 7.45:0.005:7.8;
m6all = polyval(p6,k6,[],mu6);
% figure(6)
% plot(k6,m6all)
% hold on
% plot(x6,i6,'o')
% legend('Fitted curve','Actual curve')

%% Case - 7: x = 7.8 to x = 9.3

x7 = X(157:187);
i7 = I(157:187);
% For this section Moment of inertia is constant and is equal to 3.85 %

M7 = zeros(numel(x7),1);
for i = 1:numel(x7)
    M7(i,1) = 3.85; 
end

k7 = 7.8:0.005:9.3;
for  i = 1:301
    m7all(i,1) = 3.85;
end
% figure(7)
% plot(k7,m7all)
% hold on
% plot(x7,i7,'o')
% legend('Fitted curve','Actual curve')

%% Case - 8: x = 9.3 to x = 9.7

x8 = X(187:195);
i8 = I(187:195);
i8(1) = 3.85;
[p8,s8,mu8] = polyfit(x8,i8,4);
M8 = polyval(p8,x8,[],mu8);
T8 = table(x8,i8,M8);
T8.Error  = (T8.i8 - T8.M8).*(100./T8.i8); % Percentage error

k8 = 9.3:0.005:9.7;
m8all = polyval(p8,k8,[],mu8);
% figure(8)
% plot(k8,m8all)
% hold on
% plot(x8,i8,'o')
% legend('Fitted curve','Actual curve')

%% Case - 9: x = 9.7 to x = 9.95

x9 = X(195:200);
i9 = I(195:200);
i9(1) = M8(end);
[p9,s9,mu9] = polyfit(x9,i9,3);
M9 = polyval(p9,x9,[],mu9);
T9 = table(x9,i9,M9);
T9.Error  = (T9.i9 - T9.M9).*(100./T9.i9); % Percentage error

k9 = 9.7:0.005:9.95;
m9all = polyval(p9,k9,[],mu9);
% figure(9)
% plot(k9,m9all)
% hold on
% plot(x9,i9,'o')
% legend('Fitted curve','Actual curve')

%% Case - 10: x = 9.95 to x = 14.5

x10 = X(200:291);
i10 = I(200:291);
i10(1) = M9(end);
[p10,s10,mu10] = polyfit(x10,i10,8);
M10 = polyval(p10,x10,[],mu10);
T10 = table(x10,i10,M10);
T10.Error  = (T10.i10 - T10.M10).*(100./T10.i10); % Percentage error

k10 = 9.95:0.005:14.5;
m10all = polyval(p10,k10,[],mu10);
% figure(10)
% plot(k10,m10all)
% hold on
% plot(x10,i10,'o')
% legend('Fitted curve','Actual curve')

%% Case - 11: x = 14.5 to x = 14.75

x11 = X(291:296);
i11 = I(291:296);
i11(1) = M10(end);
[p11,s11,mu11] = polyfit(x11,i11,4);
M11 = polyval(p11,x11,[],mu11);
T11 = table(x11,i11,M11);
T11.Error  = (T11.i11 - T11.M11).*(100./T11.i11); % Percentage error

k11 = 14.5:0.005:14.75;
m11all = polyval(p11,k11,[],mu11);
% figure(11)
% plot(k11,m11all)
% hold on
% plot(x11,i11,'o')
% legend('Fitted curve','Actual curve')

%% Case - 12: x = 14.75 to x = 15.2

x12 = X(296:305);
i12 = I(296:305);
i12(1) = M11(end);
i12(end) = 4.82;
[p12,s12,mu12] = polyfit(x12,i12,5);
M12 = polyval(p12,x12,[],mu12);
T12 = table(x12,i12,M12);
T12.Error  = (T12.i12 - T12.M12).*(100./T12.i12); % Percentage error

k12 = 14.75:0.005:15.2;
m12all = polyval(p12,k12,[],mu12);
% figure(12)
% plot(k12,m12all)
% hold on
% plot(x12,i12,'o')
% legend('Fitted curve','Actual curve')

%% Case - 13: x = 15.2 to x = 16.65

x13 = X(305:334);
i13 = I(305:334);

% For this section Moment of inertia is constant and is equal to 4.82 %

M13 = zeros(numel(x13),1);
for i = 1:numel(x13)
    M13(i,1) = 4.82; 
end

k13 = 15.2:0.005:16.65;
for  i = 1:291
    m13all(i,1) = 4.82;
end
% figure(13)
% plot(k13,m13all)
% hold on
% plot(x13,i13,'o')
% legend('Fitted curve','Actual curve')

%% Case - 14: x = 16.65 to x = 17.05

x14 = X(334:342);
i14 = I(334:342);
i14(1) = 4.82;
[p14,s14,mu14] = polyfit(x14,i14,4);
M14 = polyval(p14,x14,[],mu14);
T14 = table(x14,i14,M14);
T14.Error  = (T14.i14 - T14.M14).*(100./T14.i14); % Percentage error

k14 = 16.65:0.005:17.05;
m14all = polyval(p14,k14,[],mu14);
% figure(14)
% plot(k14,m14all)
% hold on
% plot(x14,i14,'o')
% legend('Fitted curve','Actual curve')
 
%% Case - 15: x = 17.05 to x = 17.29

x15 = X(342:347);
i15 = I(342:347);
i15(1) = M14(end);
[p15,s15,mu15] = polyfit(x15,i15,4);
M15 = polyval(p15,x15,[],mu15);
T15 = table(x15,i15,M15);
T15.Error  = (T15.i15 - T15.M15).*(100./T15.i15); % Percentage error

k15 = 17.05:0.005:17.29;
m15all = polyval(p15,k15,[],mu15);
% figure(15)
% plot(k15,m15all)
% hold on
% plot(x15,i15,'o')
% legend('Fitted curve','Actual curve')
 
%% Case - 16: x = 17.29 to x = 21.8

x16 = X(347:437);
i16 = I(347:437);
i16(1) = M15(end);
[p16,s16,mu16] = polyfit(x16,i16,8);
M16 = polyval(p16,x16,[],mu16);
T16 = table(x16,i16,M16);
T16.Error  = (T16.i16 - T16.M16).*(100./T16.i16); % Percentage error

k16 = 17.29:0.005:21.8;
m16all = polyval(p16,k16,[],mu16);
% figure(16)
% plot(k16,m16all)
% hold on
% plot(x16,i16,'o')
% legend('Fitted curve','Actual curve')

%% Case - 17: x = 21.8 to x = 22.45

x17 = X(437:450);
i17 = I(437:450);
i17(1) = M16(end);
[p17,s17,mu17] = polyfit(x17,i17,6);
M17 = polyval(p17,x17,[],mu17);
T17 = table(x17,i17,M17);
T17.Error  = (T17.i17 - T17.M17).*(100./T17.i17); % Percentage error

k17 = 21.8:0.005:22.45;
m17all = polyval(p17,k17,[],mu17);
% figure(17)
% plot(k17,m17all)
% hold on
% plot(x17,i17,'o')
% legend('Fitted curve','Actual curve')

%% Case - 18: x = 22.45 to x = 23.9

x18 = X(450:479);
i18 = I(450:479);
% For this section Moment of inertia is constant and is equal to 4.82 %

M18 = zeros(numel(x18),1);
for i = 1:numel(x18)
    M18(i,1) = 4.82; 
end

k18 = 22.45:0.005:23.9;
m18all = zeros(291,1);
for  i = 1:291
    m18all(i,1) = 4.82;
end
% figure(18)
% plot(k18,m18all)
% hold on
% plot(x18,i18,'o')
% legend('Fitted curve','Actual curve')

%% Case - 19: x = 23.9 to x = 24.35

x19 = X(479:488);
i19 = I(479:488);
i19(1) = 4.82;
[p19,s19,mu19] = polyfit(x19,i19,4);
M19 = polyval(p19,x19,[],mu19);
T19 = table(x19,i19,M19);
T19.Error  = (T19.i19 - T19.M19).*(100./T19.i19); % Percentage error

k19 = 23.9:0.005:24.35;
m19all = polyval(p19,k19,[],mu19);
% figure(19)
% plot(k19,m19all)
% hold on
% plot(x19,i19,'o')
% legend('Fitted curve','Actual curve')

%% Case - 20: x = 24.35 to x = 24.6

x20 = X(488:493);
i20 = I(488:493);
i20(1) = M19(end);
[p20,s20,mu20] = polyfit(x20,i20,3);
M20 = polyval(p20,x20,[],mu20);
T20 = table(x20,i20,M20);
T20.Error  = (T20.i20 - T20.M20).*(100./T20.i20); % Percentage error

k20 = 24.35:0.005:24.6;
m20all = polyval(p20,k20,[],mu20);
% figure(20)
% plot(k20,m20all)
% hold on
% plot(x20,i20,'o')
% legend('Fitted curve','Actual curve')

%% Case - 21: x = 24.6 to x = 29.15

x21 = X(493:584);
i21 = I(493:584);
i21(1) = M20(end);
[p21,s21,mu21] = polyfit(x21,i21,8);
M21 = polyval(p21,x21,[],mu21);
T21 = table(x21,i21,M21);
T21.Error  = (T21.i21 - T21.M21).*(100./T21.i21); % Percentage error

k21 = 24.6:0.005:29.15;
m21all = polyval(p21,k21,[],mu21);
% figure(21)
% plot(k21,m21all)
% hold on
% plot(x21,i21,'o')
% legend('Fitted curve','Actual curve')

%% Case - 22: x = 29.15 to x = 29.4

x22 = X(584:589);
i22 = I(584:589);
i22(1) = M21(end);
[p22,s22,mu22] = polyfit(x22,i22,3);
M22 = polyval(p22,x22,[],mu22);
T22 = table(x22,i22,M22);
T22.Error  = (T22.i22 - T22.M22).*(100./T22.i22); % Percentage error

% k22 = 29.15:0.005:29.4;
% m22all = polyval(p22,k22,[],mu22);
% figure(22)
% plot(k22,m22all)
% hold on
% plot(x22,i22,'o')
% legend('Fitted curve','Actual curve')

%% Case - 23: x = 29.4 to x = 29.8

x23 = X(589:597);
i23 = I(589:597);
i23(1) = M22(end);
[p23,s23,mu23] = polyfit(x23,i23,4);
M23 = polyval(p23,x23,[],mu23);
T23 = table(x23,i23,M23);
T23.Error  = (T23.i23 - T23.M23).*(100./T23.i23); % Percentage error

k23 = 29.4:0.005:29.8;
m23all = polyval(p23,k23,[],mu23);
% figure(23)
% plot(k23,m23all)
% hold on
% plot(x23,i23,'o')
% legend('Fitted curve','Actual curve')

%% Case - 24: x = 29.8 to x = 31.3

x24 = X(597:627);
i24 = I(597:627);
% For this section Moment of inertia is constant and is equal to 3.85 %

M24 = zeros(numel(x24),1);
for i = 1:numel(x24)
    M24(i,1) = 3.85; 
end

k24 = 29.8:0.005:31.3;
m24all = zeros(301,1);
for  i = 1:301
    m24all(i,1) = 3.85;
end
% figure(24)
% plot(k24,m24all)
% hold on
% plot(x24,i24,'o')
% legend('Fitted curve','Actual curve')

%% Case - 25: x = 31.3 to x = 31.65

x25 = X(627:634);
i25 = I(627:634);
i25(1) = 3.85;
[p25,s25,mu25] = polyfit(x25,i25,4);
M25 = polyval(p25,x25,[],mu25);
T25 = table(x25,i25,M25);
T25.Error  = (T25.i25 - T25.M25).*(100./T25.i25); % Percentage error

k25 = 31.3:0.005:31.65;
m25all = polyval(p25,k25,[],mu25);
% figure(25)
% plot(k25,m25all)
% hold on
% plot(x25,i25,'o')
% legend('Fitted curve','Actual curve')

%% Case - 26: x = 31.65 to x = 31.9

x26 = X(634:639);
i26 = I(634:639);
i26(1) = M25(end);
[p26,s26,mu26] = polyfit(x26,i26,4);
M26 = polyval(p26,x26,[],mu26);
T26 = table(x26,i26,M26);
T26.Error  = (T26.i26 - T26.M26).*(100./T26.i26); % Percentage error

k26 = 31.65:0.005:31.9;
m26all = polyval(p26,k26,[],mu26);
% figure(26)
% plot(k26,m26all)
% hold on
% plot(x26,i26,'o')
% legend('Fitted curve','Actual curve')

%% Case - 27: x = 31.9 to x = 36.45

x27 = X(639:730);
i27 = I(639:730);
i27(1) = M26(end);
[p27,s27,mu27] = polyfit(x27,i27,8);
M27 = polyval(p27,x27,[],mu27);
T27 = table(x27,i27,M27);
T27.Error  = (T27.i27 - T27.M27).*(100./T27.i27); % Percentage error

k27 = 31.9:0.005:36.45;
m27all = polyval(p27,k27,[],mu27);
% figure(27)
% plot(k27,m27all)
% hold on
% plot(x27,i27,'o')
% legend('Fitted curve','Actual curve')

%% Case - 28: x = 36.45 to x = 36.7

x28 = X(730:735);
i28 = I(730:735);
i28(1) = M27(end);
[p28,s28,mu28] = polyfit(x28,i28,4);
M28 = polyval(p28,x28,[],mu28);
T28 = table(x28,i28,M28);
T28.Error  = (T28.i28 - T28.M28).*(100./T28.i28); % Percentage error

k28 = 36.45:0.005:36.7;
m28all = polyval(p28,k28,[],mu28);
% figure(28)
% plot(k28,m28all)
% hold on
% plot(x28,i28,'o')
% legend('Fitted curve','Actual curve')

%% Case - 29: x = 36.7 to x = 37.05

x29 = X(735:742);
i29 = I(735:742);
i29(1) = M28(end);
[p29,s29,mu29] = polyfit(x29,i29,6);
M29 = polyval(p29,x29,[],mu29);
T29 = table(x29,i29,M29);
T29.Error  = (T29.i29 - T29.M29).*(100./T29.i29); % Percentage error

k29 = 36.7:0.005:37.05;
m29all = polyval(p29,k29,[],mu29);
% figure(29)
% plot(k29,m29all)
% hold on
% plot(x29,i29,'o')
% legend('Fitted curve','Actual curve')

%% Case - 30: x = 37.1 to x = 80

x30 = X(743:end);
i30 = I(743:end);
M30 = zeros(length(x30),1);
for i = 1:length(x30)
    M30(i) = (35*8)/12; 
end

%% Plot
M = [M1;M2;M3;M4;M5;M6;M7;M8;M9;M10;M11;M12;M13;M14;M15;M16;M17;M18;M19;M20;M21;M22;M23;M24;M25;M26;M27;M28;M29;M30];
x = [x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28;x29;x30];

figure(30)
plot(x1,M1,x2,M2,x3,M3,x4,M4,x5,M5,x6,M6,x7,M7,x8,M8,x9,M9,x10,M10)
hold on
plot(x11,M11,x12,M12,x13,M13,x14,M14,x15,M15,x16,M16,x17,M17,x18,M18,x19,M19,x20,M20)
plot(x21,M21,x22,M22,x23,M23,x24,M24,x25,M25,x26,M26,x27,M27,x28,M28,x29,M29,x30,M30)

figure(31)
plot(x,M)
hold on
plot(X,I,'o')





