% By Mohammad Zandsalimy
% mohammad.zandsalimy@ubc.ca

function y=solveMachForArea(x)
  k=evalin('base','k');
  if (x>1e+10)
    y=1e+10;
  else
    y=(1/x)*(2*(1+(k-1)*x^2/2)/(k+1))^(0.5*(k+1)/(k-1));
  end
end