clc
clear all
close all
%% INPUTS

Es = 3e3;  % Young's modulus of the material
e = 1.87;   % Undeformed part of the ligament
r = 2.925;  % Outer radius of the circular node
t = 0.675;  % Thickness of the ligament
l = 2*6.711; % Length of the ligament
d = t/l;   % Slenderness ratio
a = 14.625; % distance between the centers
b = atand((2*r)/l); % Angle of inclination of ligaments with line joining 
% centers of 2 adjacent nodes
rho = (l-(2*e))/l;

Eh = (2*sqrt(3)*Es*(d^3)*((d^2)+(rho^2)))/(rho*((3*rho^2*d^2)+(d^4*(cosd(b))^2)...
    +(rho^4*(sind(b))^2)))
% Homogenized young's modulus

Nuh = (((d^2*(cosd(b))^2)-(rho^2*(sind(b))^2))*(rho^2-d^2))/((3*rho^2*d^2)...
    +(d^4*(cosd(b))^2)+(rho^4*(sind(b))^2))
% Homogenized poisson's ratio

Gh = (sqrt(3)/4)*Es*d*(rho^2+d^2)*(1/rho^3)

G = Eh/(2*(1+Nuh))
   
%% Case - 1: A 1N static load is applied at the point (which is at a distance
% of 37 mm from the fixed end of beam and lies on the central longitudinal axis)
% for both the beams.
% AB or ab - Auxetic beam or Hexachiral beam
% HB or hb - Homogenized beam

tic
u1_ab = xlsread('AB and HB',1,'A4:A104');
% Deflection at the point of load application for AB
u1_hb = xlsread('AB and HB',1,'F4:F104');
% Deflection at the point of load application for HB

RF1_ab = xlsread('AB and HB',1,'B4:B104');
% Reaction forces at the fixed end for AB
RF1_hb = xlsread('AB and HB',1,'G4:G104');
% Reaction forces at the fixed end for HB

L1_ab = xlsread('AB and HB',1,'C4:C225');
% Length of AB
L1_hb = xlsread('AB and HB',1,'H4:H324');
% Length of HB

Def1_ab = xlsread('AB and HB',1,'D4:D225');
% Deflection along the length for AB
Def1_hb = xlsread('AB and HB',1,'I4:I324');
% Deflection along the length for HB
toc

%PLOTS

figure(1)
plot(u1_ab,RF1_ab,'*')
hold on
plot(u1_hb,RF1_hb,'+')
hold off
xlabel('Deflection (mm)','FontWeight','bold')
ylabel('Load(N)','FontWeight','bold')
title('Load vs Deflection for loading case - 1')
legend('Hexachiral beam','Homogenized beam','Location','best')

figure(2)
plot(L1_ab,Def1_ab,'*')
hold on
plot(L1_hb,Def1_hb,'+')
hold off
xlabel('Length of beam (mm)','FontWeight','bold')
ylabel('Deflection(mm)','FontWeight','bold')
title('Deflection along the length of the beam for loading case - 1')
legend('Hexachiral beam','Homogenized beam','Location','best')

%% Case - 2: A 1N static load is applied at the free end for both the beams.
% AB or ab - Auxetic beam or Hexachiral beam
% HB or hb - Homogenized beam

tic
u2_ab = xlsread('AB and HB',2,'A4:A104');
% Deflection at the point of load application for AB
u2_hb = xlsread('AB and HB',2,'F4:F104');
% Deflection at the point of load application for HB

RF2_ab = xlsread('AB and HB',2,'B4:B104');
% Reaction forces at the fixed end for AB
RF2_hb = xlsread('AB and HB',2,'G4:G104');
% Reaction forces at the fixed end for HB

L2_ab = xlsread('AB and HB',2,'C4:C225');
% Length of AB
L2_hb = xlsread('AB and HB',2,'H4:H324');
% Length of HB

Def2_ab = xlsread('AB and HB',2,'D4:D225');
% Deflection along the length for AB
Def2_hb = xlsread('AB and HB',2,'I4:I324');
% Deflection along the length for HB
toc

%PLOTS

figure(3)
plot(u2_ab,RF2_ab,'*')
hold on
plot(u2_hb,RF2_hb,'+')
hold off
xlabel('Deflection (mm)','FontWeight','bold')
ylabel('Load(N)','FontWeight','bold')
title('Load vs Deflection for loading case - 2')
legend('Hexachiral beam','Homogenized beam','Location','best')

figure(4)
plot(L2_ab,Def2_ab,'*')
hold on
plot(L2_hb,Def2_hb,'+')
hold off
xlabel('Length of beam (mm)')
ylabel('Deflection(mm)')
title('Deflection along the length of the beam for loading case - 2')
legend('Hexachiral beam','Homogenized beam','Location','best')

%% Case - 3: Variation of 'e'(lies in E_hom and Nu_hom expression) for the same
% loading case as in case - 1
% AB or ab - Auxetic or Hexachiral beam
% HB or hb - Homogenized beam

tic
L3_ab = xlsread('AB and HB',3,'E4:E225');
% Length of AB
L3_hb1 = xlsread('AB and HB',3,'H4:H324');
% Length of HB with e = 1.67
L3_hb2 = xlsread('AB and HB',3,'K4:K324');
% Length of HB with e = 1.77
L3_hb3 = xlsread('AB and HB',3,'N4:N324');
% Length of HB with e = 1.87
L3_hb4 = xlsread('AB and HB',3,'Q4:Q324');
% Length of HB with e = 1.87
L3_hb5 = xlsread('AB and HB',3,'T4:T324');
% Length of HB with e = 2.07

Def3_ab = xlsread('AB and HB',3,'F4:F225');
% Deflection along the length of AB
Def3_hb1 = xlsread('AB and HB',3,'I4:I324');
% Deflection along the length of HB with e = 1.67
Def3_hb2 = xlsread('AB and HB',3,'L4:L324');
% Deflection along the length of HB with e = 1.77
Def3_hb3 = xlsread('AB and HB',3,'O4:O324');
% Deflection along the length of HB with e = 1.87
Def3_hb4 = xlsread('AB and HB',3,'R4:R324');
% Deflection along the length of HB with e = 1.97
Def3_hb5 = xlsread('AB and HB',3,'U4:U324');
% Deflectio along the length of HB with e = 2.07
toc

% PLOTS

figure(5)
plot(L3_ab,Def3_ab,'--')
hold on
plot(L3_hb1,Def3_hb1,'*')
plot(L3_hb2,Def3_hb2,'.')
plot(L3_hb3,Def3_hb3,'+')
plot(L3_hb4,Def3_hb4,'o')
plot(L3_hb5,Def3_hb5,'-')
xlabel('Length of the beam (mm)')
ylabel('Deflection(mm)')
title('Deflection profile along the length of beam for different values of "e"')
legend('Hexachiral beam','e = 1.67','e = 1.77','e = 1.87'...
    ,'e = 1.97','e = 2.07','Location','best')

%% Case - 4: Variation of 'E_hom'(and fixing Nu_hom) for the same loading
% case as in case - 1
% AB or ab - Auxetic or Hexachiral beam
% HB or hb - Homogenized beam

tic
L4_ab = xlsread('AB and HB',4,'D4:D225');
% Length of AB
L4_hb1 = xlsread('AB and HB',4,'G4:G324');
% Length of HB with E_hom = 465 MPa
L4_hb2 = xlsread('AB and HB',4,'J4:J324');
% Length of HB with E_hom = 470 MPa
L4_hb3 = xlsread('AB and HB',4,'M4:M324');
% Length of HB with E_hom = 473.8696 MPa
L4_hb4 = xlsread('AB and HB',4,'P4:P324');
% Length of HB with E_hom = 480 MPa
L4_hb5 = xlsread('AB and HB',4,'S4:S324');
% Length of HB with E_hom = 485 MPa

Def4_ab = xlsread('AB and HB',4,'E4:E225');
% Deflection along the length of AB
Def4_hb1 = xlsread('AB and HB',4,'H4:H324');
% Deflection along the length of HB with E_hom = 465 MPa
Def4_hb2 = xlsread('AB and HB',4,'K4:K324');
% Deflection along the length of HB with E_hom = 470 MPa
Def4_hb3 = xlsread('AB and HB',4,'N4:N324');
% Deflection along the length of HB with E_hom = 473.8696 MPa
Def4_hb4 = xlsread('AB and HB',4,'Q4:Q324');
% Deflection along the length of HB with E_hom = 480 MPa
Def4_hb5 = xlsread('AB and HB',4,'T4:T324');
% Deflectio along the length of HB with E_hom = 485 MPa
toc

% PLOTS

figure(6)
plot(L4_ab,Def4_ab,'--')
hold on
plot(L4_hb1,Def4_hb1,'*')
plot(L4_hb2,Def4_hb2,'.')
plot(L4_hb3,Def4_hb3,'+')
plot(L4_hb4,Def4_hb4,'o')
plot(L4_hb5,Def4_hb5,'-')
xlabel('Length of the beam (mm)')
ylabel('Deflection(mm)')
title('Deflection profile along the length of beam for different values of "E_{hom}"')
legend('Hexachiral beam','E_{hom} = 465 MPa','E_{hom} = 470 MPa','E_{hom} = 473.8696 MPa'...
    ,'E_{hom} = 480 MPa','E_{hom} = 485 MPa','Location','best')

%% %% Case - 5: Variation of 'Nu_hom'(and fixing E_hom) for the same loading
% case as in case - 1
% AB or ab - Auxetic or Hexachiral beam
% HB or hb - Homogenized beam

tic
L5_ab = xlsread('AB and HB',5,'D4:D225');
% Length of AB
L5_hb1 = xlsread('AB and HB',5,'G4:G324');
% Length of HB with Nu_hom = -0.84
L5_hb2 = xlsread('AB and HB',5,'J4:J324');
% Length of HB with Nu_hom = -0.86
L5_hb3 = xlsread('AB and HB',5,'M4:M324');
% Length of HB with Nu_hom = -0.8884
L5_hb4 = xlsread('AB and HB',5,'P4:P324');
% Length of HB with Nu_hom = -0.91
L5_hb5 = xlsread('AB and HB',5,'S4:S324');
% Length of HB with Nu_hom = -0.93

Def5_ab = xlsread('AB and HB',5,'E4:E225');
% Deflection along the length of AB
Def5_hb1 = xlsread('AB and HB',5,'H4:H324');
% Deflection along the length of HB with Nu_hom = -0.84
Def5_hb2 = xlsread('AB and HB',5,'K4:K324');
% Deflection along the length of HB with Nu_hom = -0.86
Def5_hb3 = xlsread('AB and HB',5,'N4:N324');
% Deflection along the length of HB with Nu_hom = -0.8884
Def5_hb4 = xlsread('AB and HB',5,'Q4:Q324');
% Deflection along the length of HB with Nu_hom = -0.91
Def5_hb5 = xlsread('AB and HB',5,'T4:T324');
% Deflectio along the length of HB with Nu_hom = -0.93
toc

% PLOTS

figure(7)
plot(L5_ab,Def5_ab,'--')
hold on
plot(L5_hb1,Def5_hb1,'*')
plot(L5_hb2,Def5_hb2,'.')
plot(L5_hb3,Def5_hb3,'+')
plot(L5_hb4,Def5_hb4,'o')
plot(L5_hb5,Def5_hb5,'-')
xlabel('Length of the beam (mm)')
ylabel('Deflection(mm)')
title('Deflection profile along the length of beam for different values of "\nu_{hom}"')
legend('Hexachiral beam','\nu_{hom} = -0.84','\nu_{hom} = -0.86','\nu_{hom} = -0.8884'...
    ,'\nu_{hom} = -0.91','\nu_{hom} = -0.93','Location','best')

%% Case - 6: A sinusoidal load of max force 0.1N is applied at the point which is at
% 37 mm from the fixed end for both the beams at their natural frequency. A
% damping of 0.02 is provided for both the beams.
% Load for AB - 0.1*Sin(2*pi*t*1.4294)
% Load for HB - 0.1*Sin(2*pi*t*1.4192)
% AB or ab - Hexachiral or Auxetic beam
% HB or hb - Homogenized beam

tic
t6 = xlsread('AB and HB',6,'A4:A4004');
% Time step for both the AB and HB

RF6_ab = xlsread('AB and HB',6,'B4:B4004');
% Reaction force at the fixed end for AB
RF6_hb = xlsread('AB and HB',6,'I4:I4004');
% Reaction force at the fixed end for HB
IF6_ab = xlsread('AB and HB',6,'E4:E4004');
% Input force for the AB
IF6_hb = xlsread('AB and HB',6,'L4:L4004');
% Input force for the HB

u6_ab = xlsread('AB and HB',6,'D4:D4004');
% Deflection at point of load application for AB
u6_hb = xlsread('AB and HB',6,'K4:K4004');
% Deflection at point of load application for HB 
toc

% PLOTS

figure(8)       
plot(t6,IF6_ab)
hold on
plot(t6,IF6_hb)
hold off
ylim([-0.15,0.15])
xlim([-0.1,2.5])
xlabel('Time(s)')
ylabel('Input force (N)')
title('Input force vs time')
legend('Hexachiral beam','Homogenized beam','Location','best')

figure(9)
plot(t6,RF6_ab)
hold on
plot(t6,RF6_hb)
hold off
xlabel('Time(s)')
ylabel('Reaction force (N)')
title('Reaction force vs time')
legend('Hexachiral beam','Homogenized beam','Location','best')

figure(10)
plot(t6,u6_ab)
hold on
plot(t6,u6_hb)
hold off
xlabel('Time(s)')
ylabel('Deflection (mm)')
title('Deflection vs time')
legend('Hexachiral beam','Homogenized beam','Location','best')


 %% Case - 7: A sinusoidal load of max force 0.1N is applied at the point which is at
% 37 mm from the fixed end for both the beams at their natural frequency.
% Load for AB - 0.1*Sin(2*pi*t*1.4294)
% Load for HB - 0.1*Sin(2*pi*t*1.4192)
% AB or ab - Hexachiral or Auxetic beam
% HB or hb - Homogenized beam

tic
t7 = xlsread('AB and HB',7,'A4:A4004');
% Time step for both the AB and HB

RF7_ab = xlsread('AB and HB',7,'B4:B4004');
% Reaction force at the fixed end for AB
RF7_hb = xlsread('AB and HB',7,'I4:I4004');

u7_ab = xlsread('AB and HB',7,'D4:D4004');
% Deflection at point of load application for AB
u7_hb = xlsread('AB and HB',7,'K4:K4004');
% Deflection at point of load application for HB 
toc

% PLOTS

figure(11)
plot(t7,RF7_ab)
hold on
plot(t7,RF7_hb)
hold off
xlabel('Time(s)')
ylabel('Reaction force (N)')
title('Reaction force vs time (without damping)')
legend('Hexachiral beam','Homogenized beam','Location','best')

figure(12)
plot(t7,u7_ab)
hold on
plot(t7,u7_hb)
hold off
xlabel('Time(s)')
ylabel('Deflection (mm)')
title('Deflection vs time (without damping)')
legend('Hexachiral beam','Homogenized beam','Location','best')

%% Case - 8: A sinusoidal load of max force 0.1N is applied at the point which is at
% 37 mm from the fixed end for both the beams at frequency = 5Hz. A damping
% of 0.02 is provided to both the beams
% Load for AB - 0.1*Sin(2*pi*t*5)
% Load for HB - 0.1*Sin(2*pi*t*5)
% AB or ab - Hexachiral or Auxetic beam
% HB or hb - Homogenized beam

tic
t8 = xlsread('AB and HB',8,'A4:A4004');
% Time step for both the AB and HB

RF8_ab = xlsread('AB and HB',8,'B4:B4004');
% Reaction force at the fixed end for AB
RF8_hb = xlsread('AB and HB',8,'I4:I4004');

u8_ab = xlsread('AB and HB',8,'D4:D4004');
% Deflection at point of load application for AB
u8_hb = xlsread('AB and HB',8,'K4:K4004');
% Deflection at point of load application for HB 
toc

% PLOTS

figure(11)
plot(t8,RF8_ab)
hold on
plot(t8,RF8_hb)
hold off
xlabel('Time(s)')
ylabel('Reaction force (N)')
title('Reaction force vs time (freq = 5Hz)')
legend('Hexachiral beam','Homogenized beam','Location','best')

figure(12)
plot(t8,u8_ab)
hold on
plot(t8,u8_hb)
hold off
xlabel('Time(s)')
ylabel('Deflection (mm)')
title('Deflection vs time (freq = 5 Hz)')
legend('Hexachiral beam','Homogenized beam','Location','best')

%% Case - 9: Comparison of deflection response of 1D Homogenized beam and 3D 
% Homogenized beam
% Load for 1D HB - 0.1*Sin(2*pi*t*0.74268)
% Load for 3D HB - 0.1*Sin(2*pi*t*1.4192)
% AB or ab - Hexachiral or Auxetic beam
% HB or hb - Homogenized beam

tic
t9 = xlsread('AB and HB',9,'A4:A4004');
% Time step for both the HB

u9_hb3D = xlsread('AB and HB',9,'B4:B4004');
% Deflection at point of load application for 3D HB
u9_hb1D = xlsread('AB and HB',9,'E4:E4004');
% Deflection at point of load application for 1D HB 
toc

% PLOTS

figure(13)
plot(t9,u9_hb3D)
hold on
plot(t9,u9_hb1D)
hold off
xlabel('Time(s)')
ylabel('Deflection (mm)')
title('Deflection vs time ')
legend('Homogenized beam (3D)','Homogenized beam (1D)','Location','best')

%% Case - 10: Support excitation

tic

t10 = xlsread('AB and HB',10,'A4:A4004');
% Time step for both the HB

u10_ab = xlsread('AB and HB',10,'B4:B4004');
% Deflection at point of load application for AB
u10_hb = xlsread('AB and HB',10,'E4:E4004');
% Deflection at point of load application for HB 
toc

figure(13)
plot(t10,u10_ab)
hold on
plot(t10,u10_hb)
hold off
xlabel('Time(s)')
ylabel('Deflection (mm)')
title('Deflection vs time ')
legend('Hexachiral beam','Homogenized beam','Location','best')



























