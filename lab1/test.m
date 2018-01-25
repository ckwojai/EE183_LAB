import ETS3.*
% Constant
L2 = 450;
L4 = 100;
L5 = 600;
J1 = Link([ 0, 0, 0, 0, 1], 'modified');
J2 = Link([ 0, L2, 0, 0, 0], 'modified');
J3 = Link([pi/2, 0, 0, pi/2, 1], 'modified');
J4 = Link([0, 0, L4, pi/2, 0], 'modified');
J5 = Link([pi, 0, L5, pi/2, 1], 'modified');
robot = SerialLink( [J1, J2, J3, J4, J5],  'name', 'my robot')

robot.fkine([0, 0, 100, 0, 0])
% robot.ikine([0, 0, 0, 0, 0,0]);
%robot.plot([0, 1, 0, 0], 'workspace', [100, 100, 100, 100, 100, 100])
