clc
clear all
close all
%%
m =  0.00117; % kg
k = 136.4; %N/m
Cp = 36.20e-9; % F
theta = 0.95e-5;
c = 0.0161;
w = (k/m)^(0.5);
R = 250e3;
y0 = [0,0,0];
%A = [0 1 0; -k/m -c/m -theta/m; 0 theta/Cp -1/(R*Cp)];
B = [0;15;0];
%%
time = 0:0.0025:5;
input = sin(w*time);
%plot(time,input);
R = zeros(51,1);
V_max = zeros(51,1);
tic
for i = 1:50
    R(1,1) = 1e3;
    R(i+1,1) = R(i,1)+10e3;
    A = [0 1 0; -k/m -c/m -theta/m; 0 theta/Cp -1/(R(i,1)*Cp)];
    [t,x] = ode45(@(t,x) resp(t,x,input,time,A,B),time,y0);
    V_max(i,1) = max(x(:,3));
end
toc
%[t,x] = ode45(@(t,x) resp(t,x,input,time,A,B),time,y0);

figure(1)
subplot(3,1,1)
plot(time,x(:,1))
xlabel('Time(s)','fontweight','bold')
ylabel('Displacement(m)','fontweight','bold')
subplot(3,1,2)
plot(time,x(:,2))
xlabel('Time(s)','fontweight','bold')
ylabel('Velocity','fontweight','bold')
subplot(3,1,3)
plot(time,x(:,3))
ylabel('Voltage(V)','fontweight','bold')
xlabel('Time(s)','fontweight','bold')
figure(2)
plot(R,V_max)
xlabel('Resistance (ohm)','fontweight','bold')
ylabel('Maximum Voltage (V)','fontweight','bold')

function dxdt = resp(t,x,z,time_z,A,B)
input_int = interp1(time_z,z,t);
dxdt = A*x+B*input_int;
end