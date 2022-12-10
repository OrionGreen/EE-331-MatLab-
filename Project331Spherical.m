%331 Project

% Spherical Capacitor
a = 640/18*10^-2;
b = 2*(640/18)*10^-2;
c = 3*(640/18)*10^-2;
V1 = 640/18*10^3;
V2 = 0;

sphereV = readtable("SphericalCapVoltage.txt");
sphereVx = table2array(sphereV(:,1)).';
sphereVy = table2array(sphereV(:,2)).';

figure(1)
plot(sphereVx, sphereVy,'--b','LineWidth',2.5, 'MarkerSize',6)
hold on;  
%

%Put 331 equation here
DistanceV = linspace(0,c,1000);

for counter =1:1:length(DistanceV); % For Calculating the 331 V equation 
    if DistanceV(counter) < a;
        sphereVCalc(counter) = V1;
    else if DistanceV(counter) >= a && DistanceV(counter) < b;
        sphereVCalc(counter) = (V1/(1/a-1/b))*(1/DistanceV(counter)-1/b);
    else;
            sphereVCalc(counter) = V2;
     end;
   end;
end;


plot(DistanceV, sphereVCalc,'r-','LineWidth',2.5, 'MarkerSize',6)

xlabel('Distance (m)');
ylabel('Volts(V)');

legend('Femm', 'Calculated')
grid on;
%
title('Spherical Capacitor Voltage Plot')


%E Field
sphereE = readtable("SphericalCapE.txt");
sphereEx = table2array(sphereE(:,1)).';
sphereEy = table2array(sphereE(:,2)).';

figure(2)
plot(sphereEx, sphereEy,'--b','LineWidth',2.5, 'MarkerSize',6)
hold on;  
%
%Put 331 equation here

 syms R th phi
        VSphere = (V1/(1/a-1/b))*(1/R-1/b);
        VSphereE = gradient(VSphere,[R,th,phi])

DistanceE = linspace(0,c,1000);

for counter =1:1:length(DistanceE); % For Calculating the 331 V equation 
    if DistanceE(counter) < a;
        sphereECalc(counter) = 0;
    else if DistanceE(counter) >= a && DistanceE(counter) < b;
        sphereECalc(counter) = (V1/(1/a-1/b))*(1/(DistanceV(counter)*DistanceV(counter)));
    else;
            sphereECalc(counter) = 0;
     end;
   end;
end;

plot(DistanceE, sphereECalc,'r-','LineWidth',2.5, 'MarkerSize',6)

xlabel('Distance (m)');
ylabel('Electric Field(V/m)');

legend('Femm', 'Calculated')
grid on;
%
 title('Spherical Capacitor E Field Plot')