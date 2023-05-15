clc
clear variables
close all
%% INPUTS

Es = 70e3;  % Young's modulus of material
Nus = 0.3;  % Poisson's ratio of material
t = 0.08;   % thickness of honeycomb(mm)
h = 3.7;    % (mm)
l = 3.7;    % (mm)
theta = 30; % (degrees)

m = cosd(theta);
n = sind(theta);
Gs = Es/(2*(1+Nus));

%% MUTHU - IITG;

Em1 = (t/l)*(Es*m)*(1/((h/l)+n))*(1/(m^2+(n^2*(l/t)^2)));
Em2 = Es*(t/l)*((h/l)+n)*(1/m)*(1/(n^2+(m^2*(l/t)^2)));
Num12 = n*(1+(l/t)^2)*(1/(((h/l)+n)*(1+((n/m)*(l/t))^2)));
Gm12 = (t/l)^3*(l/h)^2*Es*((h/l)+n)*(1/(m*(1+(h/(4*l)))));
Em3 = (t/l)*Es*(1+(h/l))*(1/m)*(1/((h/l)+n));
Gm13 = (t/l)*Gs*(m/((h/l)+n));
Gm23 = (t/l)*Gs*((h/l)+n)*(1/m)*(1/(1+(h/l)));
Num13 = Nus*Em1/Em3;
Num23 = Nus*Em2/Em3;

%% L.J.Gibson & Ashby

Eg1 = (t/l)^3*Es*m*(1/n^2)*(1/((h/l)+n));
Eg2 = (t/l)^3*Es*((h/l)+n)*(1/m^3);
Nug12 = (m^2/n)*(1/((h/l)+n));
Gg12 = (t/l)^3*Es*((h/l)+n)*(l/h)^2*(1/m)*(1/(1+(h/(4*l))));
Eg3 = (t/l)*Es*(1+(h/l))*(1/m)*(1/((h/l)+n));
Gg13 = (t/l)*Gs*(m/((h/l)+n));
Gg23 = (t/l)*Gs*((h/l)+n)*(1/m)*(1/(1+(h/l)));

%% Finding elastic constants for different orientiations
% 
% E1 = 16.9641;
% E2 = 16.4826;
% E3 = 2273.44;
% G12 = 8.732;
% G13 = 343.565;
% G23 = 498.738;
% Nu12 = 0.998;
% Nu13 = 0.0022;
% Nu21 = 0.9702;
% Nu23 = 0.0021;
% Nu31 = 0.3;
% Nu32 = 0.2999;
% 
% Delta = (1-(Nu12*Nu21)-(Nu23*Nu32)-(Nu31*Nu13)-(2*Nu12*Nu23*Nu31))/(E1*E2*E3);
% 
% % Stiffness matrix [C] constants 
% 
% C = zeros(6,6);
% 
% C(1,1) = (1-(Nu23*Nu32))/(E2*E3*Delta);
% C(1,2) = (Nu21+(Nu31*Nu23))/(E2*E3*Delta);
% C(1,3) = (Nu31+(Nu21*Nu32))/(E2*E3*Delta);
% 
% C(2,1) = (Nu12+(Nu13*Nu32))/(E3*E1*Delta);
% C(2,2) = (1-(Nu31*Nu13))/(E3*E1*Delta);
% C(2,3) = (Nu32+(Nu31*Nu12))/(E3*E1*Delta);
% 
% C(3,1) = (Nu13+(Nu12*Nu23))/(E1*E2*Delta);
% C(3,2) = (Nu23+(Nu13*Nu21))/(E1*E2*Delta);
% C(3,3) = (1-(Nu12*Nu21))/(E1*E2*Delta);
% 
% C(4,4) = 2*G23;
% C(5,5) = 2*G13;
% C(6,6) = 2*G12;
% 
% theta = 90;         %orientation angle
% m = cosd(theta);
% n = sind(theta);
% 
% T1 = zeros(6,6);
% T1(1,1) = m^2; T1(1,2) = n^2; T1(1,6) = 2*m*n;
% T1(2,1) = n^2; T1(2,2) = m^2; T1(2,6) = -2*m*n;
% T1(3,3) = 1; 
% T1(4,4) = m; T1(4,5) = -n;
% T1(5,4) = n; T1(5,5) = m;
% T1(6,1) = -m*n; T1(6,2) = m*n; T1(6,6) = m^2-n^2;
% 
% T2 = inv(T1);
% 
% C_new = T2*C*T1;
% 
% % Finding the new elastic constants
% S_new = inv(C_new);
% 
% E1_new = 1/S_new(1,1);
% E2_new = 1/S_new(2,2);
% E3_new = 1/S_new(3,3);
% 
% G12_new = 1/S_new(6,6);
% G23_new = 1/S_new(4,4);
% G13_new = 1/S_new(5,5);
% 
% Nu12_new = -E1_new*S_new(1,2);
% Nu13_new = -E3_new*S_new(1,3);
% 
% Nu21_new = -E2_new*S_new(1,2);
% Nu23_new = -E2_new*S_new(2,3);
% 
% Nu31_new = -E3_new*S_new(1,3);
% Nu32_new = -E3_new*S_new(2,3);
% 
% % Creating table
% 
% Elastic_Properties = ["E1";"E2";"E3";"G12";"G23";"G13";"Nu12";"Nu13";"Nu21";"Nu23";"Nu31";"Nu32"];
% Elastic_constants = [E1;E2;E3;G12;G23;G13;Nu12;Nu13;Nu21;Nu23;Nu31;Nu32];
% New_Elastic_constants = [E1_new;E2_new;E3_new;G12_new;G23_new;G13_new;Nu12_new;Nu13_new;Nu21_new;Nu23_new;Nu31_new;Nu32_new];
% 
% Table = table(Elastic_Properties,Elastic_constants,New_Elastic_constants)
% 
% 
% 
% 
% 
% 






