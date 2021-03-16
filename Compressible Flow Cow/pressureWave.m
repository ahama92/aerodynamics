% By Mohammad Zandsalimy
% mohammad.zandsalimy@ubc.ca

classdef pressureWave
  properties
    speed
    radius
    theta
    x
    y
    xc
    yc
    time
    time0
  end
  methods
    function obj = pressureWave(c, xc, yc, t0)
      obj.speed = c;
      obj.radius = 0;
      obj.theta = linspace(0, 2 * pi, 101)';
      obj.x = obj.radius * cos(obj.theta) + xc;
      obj.y = obj.radius * sin(obj.theta) + yc;
      obj.xc = xc;
      obj.yc = yc;
      obj.time = 0;
      obj.time0 = t0;
    end
    function obj = setTime(obj, t)
      obj.time = t;
      obj = obj.update;
    end
    function obj = update(obj)
      obj.radius = obj.speed * obj.time;
      obj.x = obj.radius * cos(obj.theta) + obj.xc;
      obj.y = obj.radius * sin(obj.theta) + obj.yc;
    end
  end
end