%sf = 64;%factor de dispersion
%tb =1;
% Define el factor de dispersión máximo
maxSF = 64;

% Calcula la longitud de los códigos
codeLength = 2^nextpow2(maxSF);

% Genera la matriz de Walsh-Hadamard
walshHadamardMatrix = hadamard(codeLength);

% Inicializa la matriz para almacenar los códigos OVSF
ovsfCodes = zeros(maxSF, maxSF);

% Selecciona los códigos OVSF apropiados de la matriz de Walsh-Hadamard
for i = 1:maxSF
    ovsfCodes(i, :  ) = walshHadamardMatrix(i, 1:maxSF);
end

% Visualiza los códigos OVSF
%disp('Códigos OVSF generados:');
%disp(ovsfCodes);
Tb = 1;
% fdtb = 16;
% bits = randi([0 1],1,fdtb);
% for n=1:fdtb
%     if(bits(1,n) == 0)
%         bits(1,n) = bits(1,n)-1;
%     end
% end
% %codAsignado =[ovsfCodes(4,:);ovsfCodes(8,:);ovsfCodes(16,:);ovsfCodes(16,:)];
% codAsignado =[1 -1 1 -1 0 0 0 0 0 0 0 0 0 0 0 0;1 1 1 1 -1 -1 -1 -1 0 0 0 0 0 0 0 0;1 1 -1 -1 1 1 -1 -1 1 1 -1 -1 1 1 -1 -1;1 -1 -1 1 -1 1 1 -1 1 -1 -1 1 -1 1 1 -1];
% multiplexaje = bits.*codAsignado;
% %correlacion para recuperar bits
% tam = size(codAsignado);
% for i=1:tam(1,1) 
%     [bitsRec,c] = CXCORR(multiplexaje,codAsignado);
%     figure
%     plot(bitsRec,c);
% end
% 
% 
% %funcion de internet xd Author: G. Levin, Apr. 26, 2004.
% function [x,c]=CXCORR(a,b)
% na=norm(a);
% nb=norm(b);
% a=a/na; %normalizamos
% b=b/nb;
% for k=1:length(b)
%     c(k)=a*b';
%     b=[b(end),b(1:end-1)]; %hacemos el corrimiento circular
% end
% x=[0:length(b)-1]; %lags
% end
% 
fdtb = 16;
bits = randi([0 1], 1, fdtb) * 2 - 1; % Mapear bits a +1 y -1

% Códigos OVSF
codAsignado = [1 -1 1 -1 0 0 0 0 0 0 0 0 0 0 0 0;
               1 1 1 1 -1 -1 -1 -1 0 0 0 0 0 0 0 0;
               1 1 -1 -1 1 1 -1 -1 1 1 -1 -1 1 1 -1 -1;
               1 -1 -1 1 -1 1 1 -1 1 -1 -1 1 -1 1 1 -1];

% Modulación de espectro ensanchado
multiplexaje = bits.*codAsignado;

% Correlación cruzada para recuperar bits
tam = size(codAsignado);
for i = 1:tam(1, 1) 
    % Invertir el código OVSF antes de la multiplicación
    bitsRec = multiplexaje.*fliplr(codAsignado(i, :));
    figure
    plot(bitsRec);
end
