%% matching_model.slx Data

%% Solver sample time
T_s=1e-4;
Tend=50;
T_load=25;
T_en=T_load-0.5;%Enabling the DC source saturation after the initial synchronization

%% Network base values
S_b=100*(10^6);
V_b=230*(10^3);%L-L rms voltage
f_b=50;w_b=2*pi*f_b;
P_b=S_b;Q_b=S_b;
I_b=S_b/(sqrt(3)*V_b);
Z_b=(V_b^2)/S_b;L_b=Z_b/w_b;C_b=1/(w_b*Z_b);

%% Branch parameters 
R_lines=[0,0.017,0.039,0,0.0119,0.0085,0,0.032,0.01]*Z_b;
L_lines=[0.0576,0.092,0.17,0.0586,0.1008,0.072,0.0625,0.161,0.085]*L_b;
R_14=R_lines(1); L_14=L_lines(1);
R_45=R_lines(2); L_45=L_lines(2);
R_56=R_lines(3); L_56=L_lines(3);
R_36=R_lines(4); L_36=L_lines(4);
R_67=R_lines(5); L_67=L_lines(5);
R_78=R_lines(6); L_78=L_lines(6);
R_82=R_lines(7); L_82=L_lines(7);
R_89=R_lines(8); L_89=L_lines(8);
R_94=R_lines(9); L_94=L_lines(9);

%% Shunt parameters ([pu]*base)
C_4=0.1670*C_b;C_6=0.2835*C_b;C_8=0.2275*C_b;

%% Converter params
V1_rms=1000; %Low voltage side
I_b_LV=S_b/(sqrt(3)*V1_rms);
V_m=sqrt(2/3)*V1_rms;
Vdc_n=3*V_m;
n=200;
C_dc=0.008*(n);
R_f=0.001/n;
L_f=(1/n)*200*10^-6;
C_f=n*300*10^-6;
R_dc=(Vdc_n/(0.05*(S_b)/Vdc_n));
w_f=2*pi*5;

%% LV/MV transformer parameters
m=100;
S_bt=S_b;
V2_rms=13800;%Medium voltage side
R1_pu=1*0.00734/m;
L1_pu=1*0.0186/m;
R2_pu=R1_pu;
L2_pu=L1_pu;
Rm_pu=10*347.82/m;
Lm_pu=10*156.68/m;

%% Control parameters

%DC source and governor-turbine time constants
tau_dc=0.05;tau_g=5;
%defining SM governer gain----------------------
droop_percentage=1;
% grid-forming converter control----------------
I_b_dc=S_b/Vdc_n;
i_loss_dc=Vdc_n/R_dc;
i_ul=1.15*(S_b/Vdc_n)+i_loss_dc;%dc source saturation limits
i_ll=-1.15*(S_b/Vdc_n)-i_loss_dc;%dc source saturation limits
% DC voltage control--------------------------------
eta_1= w_b/Vdc_n;
m_p=(2*pi*0.5)/(S_b);
k_dc=eta_1/(Vdc_n*m_p);
K_p=(1/Vdc_n);
K_r=1/R_dc;
% AC voltage control--------------------------------
ki_v_ac=2*0.25;
kp_v_ac=0.001;
% Voltage loop----------------------------------------
n=200;
Kp_v =0.52;
Ki_v =(n)*1.161022;
Kff_v = 1;
Ti_v = Kp_v/Ki_v; 
% Current loop
Kp_i =0.738891;
Ki_i =(1/n)*1.19;
Kff_i = 1;
Ti_i = Kp_i / Ki_i;

%% Network loading and set-points
base=2.25; % base load
load_change=0.75;% load disturbance
ps=base/3; %set-ponit in [MW]
pl=S_b*ps; %loads in [W]
load_step=S_b*load_change; %disturbance in [W]