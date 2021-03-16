% By Mohammad Zandsalimy
% mohammad.zandsalimy@ubc.ca

function [y,A_star_c2,pc02]=solveForShockPosition(x,a,b)
  k=evalin('base','k');
  A=evalin('base','A');
  
  while (abs(b-a)>1e-10)
    c=(a+b)/2;
    
    Mc1=solveAeraForMach(area(c)/1.0,1,1000);
    Mc2=sqrt(((k-1)*Mc1^2+2)/(2*k*Mc1^2-k+1));
    pc1=solveMachForPressure(Mc1);
    pc2=pc1*(2*k*Mc1^2-k+1)/(k+1);
    pc02=(Mc1/Mc2)*((1+Mc2^2*(k-1)*0.5)/(1+Mc1^2*(k-1)*0.5))^(0.5*(k+1)/(k-1));
    A_star_c2=area(c)/solveMachForArea(Mc2);
    Mce=solveAeraForMach(A(end)/A_star_c2,0,1);
    pce=pc02*solveMachForPressure(Mce);

    if (pce>x)
      a=c;
    else
      b=c;
    end
  end
  
  y=c;
end