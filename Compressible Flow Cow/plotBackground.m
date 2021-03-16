% By Mohammad Zandsalimy
% mohammad.zandsalimy@ubc.ca

function plotBackground(fig)

  set(0, 'CurrentFigure', fig)
  fill([-10,-10,10,10,-10]*1000,[-10,-0.5,-0.5,-10,-10]*1000,'g','FaceAlpha',.3)
  plot([-5,50]*1000,[-0.5,-0.5]*1000,'-k')
  
  cow = imread('cow.png');
  cow=rot90(cow,2);
  image([7000,7500],[-490,-90],cow);
  
  house = imread('house.png');
  house=rot90(house,2);
  image([-1000,-300],[-500,200],house);
  
  tree = imread('tree.png');
  tree=rot90(tree,2);
  image([7600,8200],[-500,100],tree);

end