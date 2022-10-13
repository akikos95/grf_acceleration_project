%read data, smooth data, from array extract peak derivative for each surface (similar to GRF) 

%sets frequency sample (via Vicon output)
fs = 2000;

%sets array size
maxBaseline_5 = [5,1];
maxBaseline_6 = [5,1];
maxBaseline_9 = [5,1];
maxGolf_5 = [5,1];
maxGolf_6 = [5,1];
maxGolf_9 = [5,1];
maxGrass_5 = [5,1];
maxGrass_6 = [5,1];
maxGrass_9 = [5,1];
maxRubber_5 = [5,1];
maxRubber_6 = [5,1];
maxRubber_9 = [5,1];

%reads in the acceleration (Player Load) data 5 trials from each surface -
%divided by 1000 so y-axis is m/s
Baseline = readmatrix('C:\Users\Alex\Documents\Fall 2021 Classes\SPRT 6110\Landing_Data_10222021\AllBaselines_Acceleration.xlsx');
    %creates 3 new variables for each of the sensors:
    %#5 (foot), #6 (shank), #9 (thigh)
    Baseline_5 = Baseline(1:2000,1:5);
    Baseline_6 = Baseline(1:2000,6:10);
    Baseline_9 = Baseline(1:2000,11:15);
    Baseline_test = Baseline(1:2000,[1;6;11]);
    %applies a Butterworth filter to smooth the data for each of the accelerometer sensors
    smooth_Baseline_5 = my_filt(Baseline_5,10,fs,1);
    smooth_Baseline_6 = my_filt(Baseline_6,10,fs,1);
    smooth_Baseline_9 = my_filt(Baseline_9,10,fs,1);
    smooth_Baseline_test = my_filt(Baseline_test,10,fs,1);    
    %loops through and finds the peak value from each trial for each this
    %surface and calculates the standard deviation
    for x = 1:5
        maxBaseline_5(x) = max(smooth_Baseline_5(:,x));
        maxBaseline_6(x) = max(smooth_Baseline_6(:,x));
        maxBaseline_9(x) = max(smooth_Baseline_9(:,x));
        if x == 5
            avgBaseline5 = mean(maxBaseline_5);
            s_baseline5 = std(maxBaseline_5);
            avgBaseline6 = mean(maxBaseline_6);
            s_baseline6 = std(maxBaseline_6);
            avgBaseline9 = mean(maxBaseline_9);
            s_baseline9 = std(maxBaseline_9);
        end
    end
Golf = readmatrix('C:\Users\Alex\Documents\Fall 2021 Classes\SPRT 6110\Landing_Data_10222021\AllGolf_Acceleration.xlsx');
    %creates 3 new variables for each of the sensors:    
    %#5 (foot), #6 (shank), #9 (thigh)  
    Golf_5 = Golf(1:2000,1:5); %creates variable for sensor # 5
    Golf_6 = Golf(1:2000,6:10); %creates variable for sensor # 6
    Golf_9 = Golf(1:2000,11:15); %creates variable for sensor # 9        
    %applies a Butterworth filter to smooth the data for each of the accelerometer sensors
    smooth_Golf_5 = my_filt(Golf_5,10,fs,1);
    smooth_Golf_6 = my_filt(Golf_6,10,fs,1);
    smooth_Golf_9 = my_filt(Golf_9,10,fs,1);
    %loops through and finds the peak value from each trial for each this
    %surface and calculates the standard deviation
    for x = 1:5
        maxGolf_5(x) = max(smooth_Golf_5(:,x));
        maxGolf_6(x) = max(smooth_Golf_6(:,x));
        maxGolf_9(x) = max(smooth_Golf_9(:,x));
        if x == 5
            avgGolf5 = mean(maxGolf_5);
            s_Golf5 = std(maxGolf_5);
            avgGolf6 = mean(maxGolf_6);
            s_Golf6 = std(maxGolf_6);
            avgGolf9 = mean(maxGolf_9);
            s_Golf9 = std(maxGolf_9);
        end
    end
Grass = readmatrix('C:\Users\Alex\Documents\Fall 2021 Classes\SPRT 6110\Landing_Data_10222021\AllGrass_Acceleration.xlsx');
    %creates 3 new variables for each of the sensors:    
    %#5 (foot), #6 (shank), #9 (thigh)    
    Grass_5 = Grass(1:4000,1:5); %creates variable for sensor # 5
    Grass_6 = Grass(1:4000,6:10); %creates variable for sensor # 6
    Grass_9 = Grass(1:4000,11:15); %creates variable for sensor # 9
    Grass_test = Grass(:,[1;6;11]);
    %applies a Butterworth filter to smooth the data for each of the accelerometer sensors
    smooth_Grass_5 = my_filt(Grass_5,10,fs,1);
    smooth_Grass_6 = my_filt(Grass_6,10,fs,1);
    smooth_Grass_9 = my_filt(Grass_9,10,fs,1);
    smooth_grass_test = my_filt(Grass_test,10,fs,1);    
    %loops through and finds the peak value from each trial for each this
    %surface and calculates the standard deviation
    for x = 1:5
        maxGrass_5(x) = max(smooth_Grass_5(:,x));
        maxGrass_6(x) = max(smooth_Grass_6(:,x));
        maxGrass_9(x) = max(smooth_Grass_9(:,x));
        if x == 5
            avgGrass5 = mean(maxGrass_5);
            s_Grass5 = std(maxGrass_5);
            avgGrass6 = mean(maxGrass_6);
            s_Grass6 = std(maxGrass_6);
            avgGrass9 = mean(maxGrass_9);
            s_Grass9 = std(maxGrass_9);
        end
    end
Rubber = readmatrix('C:\Users\Alex\Documents\Fall 2021 Classes\SPRT 6110\Landing_Data_10222021\AllRubber_Acceleration.xlsx');
    %creates 3 new variables for each of the sensors:    
    %#5 (foot), #6 (shank), #9 (thigh)    
    Rubber_5 = Rubber(1:6000,1:5); %creates variable for sensor # 5
    Rubber_6 = Rubber(1:6000,6:10); %creates variable for sensor # 6
    Rubber_9 = Rubber(1:6000,11:15); %creates variable for sensor # 9        
    %applies a Butterworth filter to smooth the data for each of the accelerometer sensors
    smooth_Rubber_5 = my_filt(Rubber_5,10,fs,1);
    smooth_Rubber_6 = my_filt(Rubber_6,10,fs,1);
    smooth_Rubber_9 = my_filt(Rubber_9,10,fs,1);
    %loops through and finds the peak value from each trial for each this
    %surface and calculates the standard deviation
    for x = 1:5
        maxRubber_5(x) = max(smooth_Rubber_5(:,x));
        maxRubber_6(x) = max(smooth_Rubber_6(:,x));
        maxRubber_9(x) = max(smooth_Rubber_9(:,x));
        if x == 5
            avgRubber5 = mean(maxRubber_5);
            s_Rubber5 = std(maxRubber_5);
            avgRubber6 = mean(maxRubber_6);
            s_Rubber6 = std(maxRubber_6);
            avgRubber9 = mean(maxRubber_9);
            s_Rubber9 = std(maxRubber_9);
        end
    end


plot(smooth_Baseline_test,'DisplayName','smooth_Baseline_test')
xlim ([0 1000])
xlabel('Frequency (Hz)') 
ylabel('Total Acceleration (m/s)')





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



plot(smooth_grass_test,'DisplayName','smooth_grass_test')
xlim([2000 5000])


figure
%plot(1:3,[d_Baseline5, d_Baseline6, d_Baseline9], line,'DisplayName','Baseline');
plot(d_Baseline5,'DisplayName','d_Baseline5');hold on;plot(d_Baseline6,'DisplayName','d_Baseline6');plot(d_Baseline9,'DisplayName','d_Baseline9');hold off;
    title('Load on Baseline')
    xlabel('Time (ms)') 
    ylabel('Player Load (Work)')
    xlim ([0 2000])
    %xticklabels(surfacetype);
    grid on;

%finds the average peak value from each surface
avgBaseline = mean(maxBaseline);
%avgGolf = mean(maxGolf);
%avgGrass = mean(maxGrass);
%avgRubber = mean(maxRubber);

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

%smooth_Baseline = my_filt(Baseline,10,fs,1);
%smooth_Golf = my_filt(Golf,10,fs,1);
%smooth_Grass = my_filt(Grass,10,fs,1);
%smooth_Rubber = my_filt(Rubber,10,fs,1);

figure
%plot(smooth_Baseline,'DisplayName','Baseline');hold on; plot(smooth_Golf,'DisplayName','Baseline');hold on; plot(smooth_Grass,'DisplayName','Baseline');hold on; plot(smooth_Rubber,'DisplayName','Baseline');hold off
plot(Baseline,'DisplayName','Baseline');
    title('GRF of Landing Surfaces')
    xlabel('Time (ms)') 
    ylabel('Force (N)') 
    xticklabels(surfacetype);
    grid on;
hold off;

