%First Central Difference Calculation
%Called as:  y = fsd(data, fs)
%
%where
%	y = derivative of data
%	data = data set to calculate from
%	fs = sample frequency in Hz

%=================================================
function [firstderivative]=fsd(data,fs)

    %set fs to time interval
    t = 1/fs;
    timeinterval = 2*t;
   
	%find length of data set
    datalength = length(data);
   
   %processing loop, start at second row and end at length-1
   for i = 2:datalength-1
      
      first = data(i-1);
      last = data(i+1);
      
      %calculate first derivative
      firstderivative(i) = (last-first)/timeinterval;
      
   end
   
   %calculate first and last rows for firstderivative based on average between
   %two frames
   
   firstderivative(1)=(data(2)-data(1))/t;
   firstderivative(datalength)=(data(datalength)-data(datalength-1))/t;   
   
  