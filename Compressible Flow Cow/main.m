% By Mohammad Zandsalimy
% mohammad.zandsalimy@ubc.ca

clc; clear all; close all;

R = 287.058; % Ideal gas constant [J.kg^-1.K^-1]
k = 1.4; % Ideal gas heat capacity ratio
T = 273.15 + 20; % Static temperature [K]
c = sqrt(k * R * T); % Speed of sound [m.s^-1]

s.x0 = 0; % The x location of the source at the begining 
s.y0 = 0; % The y location of the source at the begining 
s.x = s.x0; % The x location of the source in time
s.y = s.y0; % The y location of the source in time
s.M = 1.5; % The horizontal Mach number of the source

frequency = 2;
if s.M<1
  endTime = floor(8000/c);
else
  endTime = floor(8000/(s.M*c));
end
fps = 30;

figCoeff = 5;
fig = figure('position', [50, 50, 1600, 500]);
hold on;
plotBackground(fig);
soursePlot = plot(s.x, s.y, 'ok');
timerText = text(s.x - c * figCoeff * 0.9, s.y + c * figCoeff * 0.9, ['Time = ', num2str(0,'%.2f'), ' s']);
axis([s.x - c * figCoeff, s.x + c * 5 * figCoeff, s.y - c * figCoeff, s.y + c * figCoeff]);
xlabel('x [km]');
xticklabels(xticks / 1000);
ylabel('y [km]');
yticklabels(yticks / 1000);
title([' Source Mach = ',num2str(s.M),' , Frequency = ',num2str(frequency),' [Hz]']);

time = linspace(0, endTime, endTime*10*frequency+1); % Simulation time
waveTime = linspace(0, endTime, endTime*frequency+1); % Wave time
k = 1;
for i = 1:length(time)
  s.x = s.M * c * time(i) + s.x0;
  set(soursePlot, 'Xdata', s.x);
  if (time(i)>waveTime(k))
    wave(k) = pressureWave(c, s.x, s.y, waveTime(k));
    wavePlot(k) = plot(wave(k).x, wave(k).y, 'Color',[255,100,100]./255);
    k = k+1;
  end
  for j = 1:k-1
    wave(j) = setTime(wave(j), time(i) - wave(j).time0);
    set(wavePlot(j), 'Xdata', wave(j).x);
    set(wavePlot(j), 'Ydata', wave(j).y);
  end
  set(timerText, 'String', ['Time = ', num2str(time(i),'%.2f'), ' s']);
  F(i) = getframe(fig);
end

for i = length(time)+1:length(time)+100
  if s.M < 0.95
    moo(fig, 'MOO');
  elseif ((s.M > 0.95)&&(s.M < 1.1))
    moo(fig, 'MOOOOOOOOOOOOOOOOOOOOOOO');
  else
    moo(fig, 'MOOOOOOOOOOOOO');
  end
  F(i) = getframe(fig);
end

% movie(fig, F, 1, fps);

v = VideoWriter(['M',num2str(s.M),'.avi']);
v.Quality = 100;
open(v);
for i = 1:length(F)
  writeVideo(v,F(i));
end
close(v);

