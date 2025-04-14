% Yichen LOU
% ssyyl67@nottingham.edu.cn

%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]

% Initialize Arduino
a = arduino('COM6', 'Uno'); % Replace 'COM6' with your port

% Blink LED on pin D3
for i = 1:10
    writeDigitalPin(a, 'D6', 1); % Turn LED on
    pause(0.5);                  % Wait 0.5 seconds
    writeDigitalPin(a, 'D6', 0); % Turn LED off
    pause(0.5);                  % Wait 0.5 seconds
end

%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
% 数据采集
V0C = 500;
TC=10;
duration = 600;
time = 0:1:duration;
temperature = zeros(size(time));
for i = 1:length(time)
    voltage = readVoltage(a, 'A1'); % 假设连接到A0引脚，需根据实际修改
    temperature(i) = (voltage*1000 - V0C) / TC; % 根据传感器文档确定V0°C和TC
end
% 计算统计量
minTemp = min(temperature);
maxTemp = max(temperature);
avgTemp = mean(temperature);
% 绘图
figure;
plot(time, temperature);
xlabel('Time (s)');
ylabel('Temperature (°C)');
% 屏幕输出
dataLogStart = datestr(now, 'dd/mm/yyyy');
location = 'Nottingham';
fprintf('Data logging initiated - %s\n', dataLogStart);
fprintf('Location - %s\n\n', location);
for i = 0:10
    fprintf('Minute%d\n', i);
    fprintf('Temperature %.2f C\n\n', temperature(i + 1));
end
fprintf('Max temp%.2f C\n', maxTemp);
fprintf('Min temp%.2f C\n', minTemp);
fprintf('Average temp%.2f C\n', avgTemp);
fprintf('Data logging terminated\n');
% 文件写入
fileID = fopen('cabin_temperature.txt', 'w');
fprintf(fileID, 'Data logging initiated - %s\n', dataLogStart);
fprintf(fileID, 'Location - %s\n\n', location);
for i = 0:10
    fprintf(fileID, 'Minute%d\n', i);
    fprintf(fileID, 'Temperature %.2f C\n\n', temperature(i + 1));
end
fprintf(fileID, 'Max temp%.2f C\n', maxTemp);
fprintf(fileID, 'Min temp%.2f C\n', minTemp);
fprintf(fileID, 'Average temp%.2f C\n', avgTemp);
fprintf(fileID, 'Data logging terminated\n');
fclose(fileID);
%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]

% Insert answers here


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Insert answers here