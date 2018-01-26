%% It seems like this implementation only work with Matlab R2017
%% Case Scenario
% Adjusting the height and rotate the chair so that it faces forward
% Initially x0 = fkine(q0) = [300 0 1150 0],
q0 = [0 0 300 0]; % INITIAL CONFIGURATION
xd = [0 300 1400 1]; % WANTED POSITIONAL STATE OF END EFFECTOR
% 1) z value increases from 1150 to 1400: Increase in q1 values
% 2) x value gets transfered to x values: Rotation in q2 values
qd = ikine(q0, xd) % THE OPERATIONAL STATE TO GET THE POSITIONAL STATE
xt = fkine(qd) % APPLY FORWARD KINEMATICS TO CHECK ANSWER
arr_xt = xt(1:4,4)';
arr_qd = qd;
% Now make y from 300 to 500 in a increments of 50 each times
for i = 1:4
    q0 = qd;
    xd = [0 300+i*50 1400 1];
    qd = ikine(q0,xd);
    xt = fkine(qd);
    arr_qd = [arr_qd; qd];
    arr_xt = [arr_xt; xt(1:4,4)'];
end
%% Trajectory Analysis
% Trajectory of headrest by rotating joint 4 by 90 degree
for i = 0:0.1:pi/2
    q = [0 0 0 i];
    x = fkine(q);
    arr_x = [arr_x x(1:4,4)'];
end
%%
t = arr_x(1,:)
y = arr_x(1,:)
plot(t,y)



