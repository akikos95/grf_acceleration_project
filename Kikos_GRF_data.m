%sets frequency sample (via Vicon output)
fs = 2000;

%reads in the 5 trials from each surface and flips the values
Baseline = -1* readmatrix('C:\Users\Alex\Documents\Fall 2021 Classes\SPRT 6110\Landing_Data_10222021\AllBaselines_Fz.xlsx');
Golf = -1* readmatrix('C:\Users\Alex\Documents\Fall 2021 Classes\SPRT 6110\Landing_Data_10222021\AllGolfs_Fz.xlsx');
Grass = -1* readmatrix('C:\Users\Alex\Documents\Fall 2021 Classes\SPRT 6110\Landing_Data_10222021\AllGrass_Fz.xlsx');
Rubber = -1* readmatrix('C:\Users\Alex\Documents\Fall 2021 Classes\SPRT 6110\Landing_Data_10222021\AllRubber_Fz.xlsx');

%{
Baseline=-1*(AllBaseline_Fz());
Golf=-1*(AllGolf_Fz());
Grass=-1*(AllGrass_Fz());
Rubber=-1*(AllRubber_Fz());
%}

%sets array size
maxBaseline = [5,1];
maxGolf = [5,1];
maxGrass = [5,1];
maxRubber = [5,1];

%loops through and finds the peak value from each trial for each surface
for x = 1:5
    maxBaseline(x) = max(Baseline(:,x));
    maxGolf(x) = max(Golf(:,x));
    maxGrass(x) = max(Grass(:,x));
    maxRubber(x) = max(Rubber(:,x));
end

%finds the average peak value from each surface
avgBaseline = mean(maxBaseline);
avgGolf = mean(maxGolf);
avgGrass = mean(maxGrass);
avgRubber = mean(maxRubber);

%finds the standard deviation for each surface
s_baseline = std(maxBaseline);
s_golf = std(maxGolf);
s_grass = std(maxGrass);
s_rubber =std(maxRubber);

%creates the bar graph of avg peak GRF from each surface
surfacetype = {'Baseline'; 'Turf'; 'Grass'; 'Rubber'};
bar(1:4,[avgBaseline, avgGolf, avgGrass,avgRubber])
%keeps the bar graph in use
hold on
    %creates the error bars using SD
    er = errorbar(1:4,[avgBaseline, avgGolf, avgGrass,avgRubber], [s_baseline,s_golf,s_grass,s_rubber], [s_baseline,s_golf,s_grass,s_rubber]);
    er.Color = [0 0 0];                            
    er.LineStyle = 'none';
    title('Average Peak GRF of Landing Surfaces')
    xlabel('Landing Surface Type') 
    ylabel('Force (N)') 
    xticklabels(surfacetype);
    grid on;
hold off

%maxBaseline1 = max(Baseline(:,1));

smooth_Baseline = my_filt(Baseline,10,fs,1);
smooth_Golf = my_filt(Golf,10,fs,1);
smooth_Grass = my_filt(Grass,10,fs,1);
smooth_Rubber = my_filt(Rubber,10,fs,1);

figure
%plot(smooth_Baseline,'DisplayName','Baseline');hold on; plot(smooth_Golf,'DisplayName','Baseline');hold on; plot(smooth_Grass,'DisplayName','Baseline');hold on; plot(smooth_Rubber,'DisplayName','Baseline');hold off
plot(Baseline,'DisplayName','Baseline');
    title('GRF of Landing Surfaces')
    xlabel('Time (ms)') 
    ylabel('Force (N)') 
    xticklabels(surfacetype);
    grid on;
hold off;
%plot(smooth_Golf,'DisplayName','Baseline');hold off;
%plot(smooth_Grass,'DisplayName','Baseline');hold off;
%plot(smooth_Baseline,'DisplayName','Baseline');hold on; plot(smooth_Golf,'DisplayName','Baseline');hold on; plot(smooth_Grass,'DisplayName','Baseline');hold on; plot(smooth_Rubber,'DisplayName','Baseline');hold off

%xlim([0 500])

%BaselineAvgs=GRFzBaseline(:,6);


%read data, smooth data, from array, extract peak derivative for each surface (similar to GRF) 