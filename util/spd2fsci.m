function FSCI = spd2fsci(spd)
numWave = 351;
t=(380:1:730)';
tspd=interp1(spd(:,1),spd(:,2),t,'spline');
tspd(isnan(tspd)) = 0.0; 
tspd = tspd/sum(tspd); % Normalize the relative spd so that the total power equals 1
%Equal energy cumulative spd
EEcum=(1/numWave:1/numWave:1)';
%Calculate FSI
sumSqrDiff = zeros(1,numWave);
for j=1:numWave 
cum = cumsum(tspd); % A MatLab function for cumulative sums 
sqrDiff = (cum-EEcum).^2; 
sumSqrDiff(j)=sum(sqrDiff); 
tspd=circshift(tspd,1); 
end 
FSI=mean(sumSqrDiff); 
FSCI=100-5.1*FSI;
end