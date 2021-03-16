% By Mohammad Zandsalimy
% mohammad.zandsalimy@ubc.ca

function y=solveMachForPressure(x)
  k=evalin('base','k');
  y=(1+(k-1)*x^2/2)^(-k/(k-1));
end