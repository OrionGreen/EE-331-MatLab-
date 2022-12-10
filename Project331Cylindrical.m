%331 Project

% Cylindrical Capacitor
a1 = 640/23*10^-2;
b1 = 2*(640/23)*10^-2;
c1 = 3*(640/23)*10^-2;
V1_1 = 640/23*10^3;
V2_1 = 0;

cylinderV = readtable("CylindricalCapVoltage.txt");
cylinderVx = table2array(cylinderV(:,1)).';
cylinderVy = table2array(cylinderV(:,2)).';

figure(1)
plot(cylinderVx, cylinderVy,'--b','LineWidth',2.5, 'MarkerSize',6)
hold on;  
%

%Put 331 equation here
DistanceV1 = linspace(0,c1,1000);

for counter1 =1:1:length(DistanceV1); % For Calculating the 331 V equation 
    if DistanceV1(counter1) < a1;
        cylinderVCalc(counter1) = V1_1;
    else if DistanceV1(counter1) >= a1 && DistanceV1(counter1) < b1;
        cylinderVCalc(counter1) = (V1_1/log(b1/a1))*(log(b1/(DistanceV1(counter1))));
    else;
            cylinderVCalc(counter1) = V2_1;
     end;
   end;
end;


plot(DistanceV1, cylinderVCalc,'r-','LineWidth',2.5, 'MarkerSize',6)

xlabel('Distance (m)');
ylabel('Volts(V)');

legend('Femm', 'Calculated')
grid on;
%
title('Cylindrical Capacitor Voltage Plot')

%E Field
cylinderE = readtable("CylindricalCapE.txt");
cylinderEx = table2array(cylinderE(:,1)).';
cylinderEy = table2array(cylinderE(:,2)).';

figure(2)
plot(cylinderEx, cylinderEy,'--b','LineWidth',2.5, 'MarkerSize',6)
hold on;  
%
%Put 331 equation here

 syms rho th z
        VCylinder = (V1_1/log(b1/a1))*(log(b1/(rho)));
        VCylinderE = gradient(VCylinder,[rho,th,z])

DistanceE1 = linspace(0,c1,1000);

for counter1 =1:1:length(DistanceE1); % For Calculating the 331 V equation 
    if DistanceE1(counter1) < a1;
        CylinderECalc(counter1) = 0;
    else if DistanceE1(counter1) >= a1 && DistanceE1(counter1) < b1;
        CylinderECalc(counter1) = V1_1/(DistanceE1(counter1)*log(b1/a1));
    else;
            CylinderECalc(counter1) = 0;
     end;
   end;
end;

plot(DistanceE1, CylinderECalc,'r-','LineWidth',2.5, 'MarkerSize',6)

xlabel('Distance (m)');
ylabel('Electric Field(V/m)');

legend('Femm', 'Calculated')
grid on;
%
 title('Cylindrical Capacitor E Field Plot')