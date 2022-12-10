%331 Project

% GIS Dead End Spherical Part
aGIS = 640/15*10^-2;
bGIS = 2*(640/15)*10^-2;
cGIS = 3*(640/15)*10^-2;
V1GIS = 640/15*10^3;
V2GIS = 0;

GISsphereV = readtable("GISSphereVoltage.txt");
GISsphereVx = table2array(GISsphereV(:,1)).';
GISsphereVy = table2array(GISsphereV(:,2)).';

figure(1)
plot(GISsphereVx, GISsphereVy,'--b','LineWidth',2.5, 'MarkerSize',6)
hold on;  
%

%Put 331 equation here
DistanceVGIS = linspace(0,cGIS,1000);

for counterGIS =1:1:length(DistanceVGIS); % For Calculating the 331 V equation 
    if DistanceVGIS(counterGIS) < aGIS;
        sphereVCalcGIS(counterGIS) = V1GIS;
    else if DistanceVGIS(counterGIS) >= aGIS && DistanceVGIS(counterGIS) < bGIS;
        sphereVCalcGIS(counterGIS) = (V1GIS/(1/aGIS-1/bGIS))*(1/DistanceVGIS(counterGIS)-1/bGIS);
    else;
            sphereVCalcGIS(counterGIS) = V2GIS;
     end;
   end;
end;


plot(DistanceVGIS, sphereVCalcGIS,'r-','LineWidth',2.5, 'MarkerSize',6)

xlabel('Distance (m)');
ylabel('Volts(V)');

legend('Femm', 'Calculated')
grid on;
%
title('Spherical Part of GIS Voltage Plot')

%E Field
sphereEGIS = readtable("GISSphericalE.txt");
sphereExGIS = table2array(sphereEGIS(:,1)).';
sphereEyGIS = table2array(sphereEGIS(:,2)).';

figure(2)
plot(sphereExGIS, sphereEyGIS,'--b','LineWidth',2.5, 'MarkerSize',6)
hold on;  
%
%Put 331 equation here

DistanceEGIS = linspace(0,cGIS,1000);

for counterGIS =1:1:length(DistanceEGIS); % For Calculating the 331 V equation 
    if DistanceEGIS(counterGIS) < aGIS;
        sphereECalcGIS(counterGIS) = 0;
    else if DistanceEGIS(counterGIS) >= aGIS && DistanceEGIS(counterGIS) < bGIS;
        sphereECalcGIS(counterGIS) = (V1GIS/(1/aGIS-1/bGIS))*(1/(DistanceVGIS(counterGIS)*DistanceVGIS(counterGIS)));
    else;
            sphereECalcGIS(counterGIS) = 0;
     end;
   end;
end;

plot(DistanceEGIS, sphereECalcGIS,'r-','LineWidth',2.5, 'MarkerSize',6)

xlabel('Distance (m)');
ylabel('Electric Field(V/m)');

legend('Femm', 'Calculated')
grid on;
%
 title('Spherical Part of GIS E Field Plot')


 % Cylindrical PART GIS
cylinderVGIS = readtable("GISCylindricalVoltage.txt");
cylinderVxGIS = table2array(cylinderVGIS(:,1)).';
cylinderVyGIS = table2array(cylinderVGIS(:,2)).';

figure(3)
plot(cylinderVxGIS, cylinderVyGIS,'--b','LineWidth',2.5, 'MarkerSize',6)
hold on;  
%

%Put 331 equation here
DistanceVGIS = linspace(0,cGIS,1000);

for counterGIS =1:1:length(DistanceVGIS); % For Calculating the 331 V equation 
    if DistanceVGIS(counterGIS) < aGIS;
        cylinderVCalcGIS(counterGIS) = V1GIS;
    else if DistanceVGIS(counterGIS) >= aGIS && DistanceVGIS(counterGIS) < bGIS;
        cylinderVCalcGIS(counterGIS) = (V1GIS/log(bGIS/aGIS))*(log(bGIS/(DistanceVGIS(counterGIS))));
    else;
            cylinderVCalcGIS(counterGIS) = V2GIS;
     end;
   end;
end;


plot(DistanceVGIS, cylinderVCalcGIS,'r-','LineWidth',2.5, 'MarkerSize',6)

xlabel('Distance (m)');
ylabel('Volts(V)');

legend('Femm', 'Calculated')
grid on;
%
title('Cylindrical Part of GIS Voltage Plot';

%E Field
cylinderEGIS = readtable("GISCylindricalE.txt");
cylinderExGIS = table2array(cylinderEGIS(:,1)).';
cylinderEyGIS = table2array(cylinderEGIS(:,2)).';

figure(4)
plot(cylinderExGIS, cylinderEyGIS,'--b','LineWidth',2.5, 'MarkerSize',6)
hold on;  
%
%Put 331 equation here


DistanceEGIS = linspace(0,cGIS,1000);

for counterGIS =1:1:length(DistanceEGIS); % For Calculating the 331 V equation 
    if DistanceEGIS(counterGIS) < aGIS;
        CylinderECalcGIS(counterGIS) = 0;
    else if DistanceEGIS(counterGIS) >= aGIS && DistanceEGIS(counterGIS) < bGIS;
        CylinderECalcGIS(counterGIS) = V1GIS/(DistanceEGIS(counterGIS)*log(bGIS/aGIS));
    else;
            CylinderECalcGIS(counterGIS) = 0;
     end;
   end;
end;

plot(DistanceEGIS, CylinderECalcGIS,'r-','LineWidth',2.5, 'MarkerSize',6)

xlabel('Distance (m)');
ylabel('Electric Field(V/m)');

legend('Femm', 'Calculated')
grid on;
%
 title('Cylindrical Part of GIS E Field Plot')

 % GIS Dead End Stub
%E Field
stubEGIS = readtable("GISStubE.txt");
stubExGIS = table2array(stubEGIS(:,1)).';
stubEyGIS = table2array(stubEGIS(:,2)).';

figure(5)
plot(stubExGIS, stubEyGIS,'--b','LineWidth',2.5, 'MarkerSize',6)
hold on;  
%
%Put 331 equation here

DistanceEGIS = linspace(0,cGIS,1000);

for counterGIS =1:1:length(DistanceEGIS); % For Calculating the 331 V equation 
    if DistanceEGIS(counterGIS) < aGIS;
        stubECalcGISSphere(counterGIS) = 0;
         stubECalcGISCylinder(counterGIS) = 0;
    else if DistanceEGIS(counterGIS) >= aGIS && DistanceEGIS(counterGIS) < bGIS;
        stubECalcGISSphere(counterGIS) = (V1GIS/(1/aGIS-1/bGIS))*(1/(DistanceVGIS(counterGIS)*DistanceVGIS(counterGIS)));
        stubECalcGISCylinder(counterGIS) = V1GIS/(DistanceEGIS(counterGIS)*log(bGIS/aGIS));
    else;
            stubECalcGISSphere(counterGIS) = 0;
             stubECalcGISCylinder(counterGIS) = 0;
     end;
   end;
end;

plot(DistanceEGIS, stubECalcGISSphere,'r-','LineWidth',2.5, 'MarkerSize',6)
plot(DistanceEGIS, stubECalcGISCylinder,'g-','LineWidth',2.5, 'MarkerSize',6)

xlabel('Distance (m)');
ylabel('Electric Field(V/m)');

legend('Femm', 'Calculated Sphere', 'Calculated Cylindrical')
grid on;
%
 title('Dead End Tip E Field Plot')
