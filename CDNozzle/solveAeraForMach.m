% By Mohammad Zandsalimy
% mohammad.zandsalimy@ubc.ca

function y=solveAeraForMach(x,a,b)
  k=evalin('base','k');
  while (abs(b-a)>1e-10)
    c=(a+b)/2;
    A=(1/a)*(2*(1+(k-1)*a^2/2)/(k+1))^(0.5*(k+1)/(k-1))-x;
    B=(1/b)*(2*(1+(k-1)*b^2/2)/(k+1))^(0.5*(k+1)/(k-1))-x;
    C=(1/c)*(2*(1+(k-1)*c^2/2)/(k+1))^(0.5*(k+1)/(k-1))-x;
    if (A*C<=0)
      b=c;
    else
      a=c;
    end
  end
  y=c;
end