clear;clc;cla;
%% map phuc tap
compMap = binaryOccupancyMap(22,20,5); 
%% TAO MANG VOI KICH THUOC THICH HOP VOI MAP
walls = zeros(100,110);   %tao ma tran 50x40 voi gia tri 0
%Khung map
walls(end,:) = 1;       %vach tuong duoi
walls(1,:) = 1;         %vach tuong tren
walls(:,end) = 1;       %vach tuong phai
walls(:,1) = 1 ;        %vach tuong trai
%% Chia 4 phong va hanh lang
walls(50,:) = 1;     %Chia ngang
walls(:,50) = 1;     %Chia doc
walls(:,60) = 1;     %Chia doc2
walls([2:6 45:49 51:55 end-6:end-1],[50 60]) = 0; % Cua ra vao hang doc
walls(50,[2:6 50:60 end-6:end-1]) = 0;
%% Phong 1
walls(1:20,26) = 1;     %vach tuong 1
walls(17,1:18) = 1;     %vach tuong 2
walls(1:5,1:15) = 1;    %ban hoc 
walls(9:10,7:8) = 1;    %ghe ngoi
walls(26,6) = 1;        %vat can ngay cua vao
walls(7,26:34) = 1;     %vach tuong 3
walls(13,34:50) = 1;    %vach tuong 4
walls(20,26:34) = 1;    %vach tuong 5
walls(28:50,11) = 1;    %vach tuong 6
walls(28,11:36) = 1;    %vach tuong 7
walls(28:40,36) = 1;    %vach tuong 8
walls(33:40,18) = 1;    %vach tuong 9
walls(33:50,26) = 1;    %vach tuong 10
walls(32,42) = 1;       %vat can goc phai ben duoi
walls(22,20) = 1;       %vat can gan tuong 1
%% Phong 2
walls(51:70,26) = 1;
walls(67,1:18) = 1; 
walls(59:60,7:8) = 1;    %ghe ngoi
walls(76,6) = 1;        %vat can ngay cua vao
walls(57,26:34) = 1;     %vach tuong 3
walls(63,34:50) = 1;    %vach tuong 4
walls(70,26:34) = 1;    %vach tuong 5
walls(78:95,11) = 1;    %vach tuong 6
walls(88,11:20) = 1;    %vach tuong 7
walls(88:92,36:40) = 1;    %vach tuong 8
walls(83:90,20) = 1;    %vach tuong 9
walls(80:100,26) = 1;    %vach tuong 10
walls(82,35:42) = 1;       %vat can goc phai ben duoi
walls(72,20) = 1;
%% Phong 3
walls(1:20,78) = 1;     %vach tuong 1
walls(17,92:120) = 1;     %vach tuong 2
walls(1:5,95:120) = 1;    %ban hoc 
walls(9:10,92:93) = 1;    %ghe ngoi
walls(26,94) = 1;        %vat can ngay cua vao
walls(7,66:74) = 1;     %vach tuong 3
walls(13,[60:68 74:85]) = 1;    %vach tuong 4
walls(20,66:74) = 1;    %vach tuong 5
walls([28:35 40:50],89) = 1;    %vach tuong 6
walls(28,66:88) = 1;    %vach tuong 7
walls(28:40,100) = 1;    %vach tuong 8
walls(33:40,82) = 1;    %vach tuong 9
walls(33:50,74) = 1;    %vach tuong 10
walls(32,58) = 1;       %vat can goc phai ben duoi
walls(22,80) = 1;       %vat can gan tuong 1
%% Phong 4
walls(51:70,94) = 1;
walls(67,102:120) = 1; 
walls(59:60,112:113) = 1;    %ghe ngoi
walls(76,104) = 1;        %vat can ngay cua vao
walls(57,86:94) = 1;     %vach tuong 3
walls(63,70:86) = 1;    %vach tuong 4
walls(70,86:94) = 1;    %vach tuong 5
walls(78:95,109) = 1;    %vach tuong 6
walls(88,100:109) = 1;    %vach tuong 7
walls(88:92,80:84) = 1;    %vach tuong 8
walls(83:90,100) = 1;    %vach tuong 9
walls(80:100,94) = 1;    %vach tuong 10
walls(82,78:85) = 1;       %vat can goc phai ben duoi
walls(72,100) = 1;
%DUA GIA TRI OCCUPANCY VAO MANG
setOccupancy(compMap,[1 1],walls,"grid")
show(compMap)
save complexMap.mat

