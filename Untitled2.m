clear;clc;cla;
%% khoi tao mobile robot
R = 0.1; % ban kinh banh xe
L = 0.5; % chieu dai co so
dd =  DifferentialDrive(R,L); % dinh nghia xe
%[v w] = forwardKinematics(dd,wL,wR); % tinh v & w dua vao wL & wR
%[wL,wR] = inverseKinematics(dd,v,w); % tinh wL & wR dua vao v & w

%% cac tham so mo phong
SampleTime = 0.1; % khoang cach giua 2 moc thoi gian
tVec = 0:SampleTime:25; % vecto thoi gian
initPose = [1;0;pi/4]; % vi tri ban dau (x0,y0& theta0)
pose = zeros(3,length(tVec)); % ma tran chua cac vi tri ung voi cac gia tri thoi gian cua tVec
pose(:,1) = initPose; % gan vi tri ban dau vao ma tran pose

%% tao duong di
close all
load complexMap
inflate(compMap,R); % thoi phong tung vi tri bi chiem dong
% tao duong di roadmap bang PRM
planner = mobileRobotPRM(compMap);
planner.NumNodes = 1000;
planner.ConnectionDistance = 1;
% ve duong di dua vao diem dau va diem cuoi
startPoint = [initPose(1),initPose(2)];
goalPoint  = [3, 1];
waypoints = findpath(planner,startPoint,goalPoint);
show(planner)
%% Pure Pursuit Controller
controller = controllerPurePursuit;
controller.Waypoints = waypoints;
controller.LookaheadDistance = 0.35;
controller.DesiredLinearVelocity = 0.75;
controller.MaxAngularVelocity = 1.5;
%% Create visualizer 
load complexMap % load map chua inflate
inflate=0;
viz = Visualizer2D;
viz.hasWaypoints = true;
viz.mapName = 'compMap';
%% Simulation loop
r = rateControl(1/SampleTime);
for i = 2:length(tVec) 
    % Chuy?n ??i t? controller sang t?c ?? quay 2 banh xe
    [vRef,wRef] = controller(pose(:,i-1));
    [wL,wR] = inverseKinematics(dd,vRef,wRef);
    
    % Tinh van toc
    [v,w] = forwardKinematics(dd,wL,wR);
    vel = [v*cos(pose(3,i-1));v*sin(pose(3,i-1));w];
    %velB = [v;0;w]; % Body velocities [vx;vy;w]
    %vel = bodyToWorld(velB,pose(:,i-1));  % ket noi vao moi truong
    %theta = pose(3);
    %vel = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0;0 0 1]*velB;
    pose(:,i) = pose(:,i-1) + vel*SampleTime; % vi tri tiep theo  
    currentpose = [pose(1,i-1);pose(2,i-1)];
    dist = norm(goalPoint' - currentpose);
    if (dist <0.2)
        disp(' Goal position reached')
        break;
    end
    % cap nhat hien thi visualizer
    viz(pose(:,i),waypoints)
    waitfor(r); 
end