%SPA.m

f=40.64*pi/180;	%latitude (rad)
l=22.93;		%longtitude(degree)
DD=22;		%Day Of the Year
MM=3;		%Month Of the Year
Tlocal=9;		%Local Hour

N=floor(275*MM/9) - 2*floor((+MM)/12)+DD-30;		%Number of Day equal to 6.3

d=23.45*sin(2*pi*(N-80)/365.2422)*pi/180;		%Declanation equal to 6.2

UT=Tlocal-2;						%Universal time ,+2hours offset. equal to 6.7

Eqt=9.85*sin(4*pi*(N-80)/365.2422)-7.65*sin(2*pi*(N-3)/365.2422);	%Equation of time equal to 6.6

Tsolar = UT+1/15 + Eqt/60;		%Solar Time Hours equal 6.5

w=(pi/12)*(Tsolar-12);		%Hour angle equal to 6.4

sb = cos(d)*cos(w)*cos(f)+sin(d)*sin(f);		%Equal to 6.10

b=asin(sb);		%Elevation Angle equal to 6.10

a=pi/2-b;		%Zenith Angle

cz = (sin(d)*cos(f)-cos(d)*cos(w)*sin(f))/cos(b); %equal to 6.9
z=acos(cz);			%Azimuth angle equal to 6.9

if (w>0) z = 2*pi - z; end

UT_sn=12-1/15 - Eqt/60;	%Solar Noon at UT[h]. equal to 6.12
Tlocal_sn=UT_sn+2;		%Solar Noon local[h]. equal 6.13

ws =acos(-tan(d)*tan(f));  %Sunset Hour Angle equal to 6.16
Tsr=12-12*ws/pi;	%Sunrise at solar time equal to 6.14
Tss=12+12*ws/pi;	%Sunset at solar time equal to 6.15
