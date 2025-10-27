%% Plot results
figure('Color', 'k');
ax1 = subplot(2,1,1);
hold on;

for i = 1:length(configs)
    plot(results(i).v.Time, results(i).v.Data, 'LineWidth', 2, 'DisplayName', configs{i}.name, "Color", configs{i}.color);
end
plot(results(1).r.Time, results(1).r.Data, '--', 'LineWidth', 2, 'DisplayName', 'Setpoint', "Color", "#D95319");
legend('TextColor', 'w', 'Color', 'k', 'EdgeColor', ...
    [0.5 0.5 0.5], 'LineWidth', 1, 'FontSize', 10);
hold off;
grid on;
legend('Location', 'best');
ylabel('Speed (m/s)');
%title('Angular Position');
ax1.Color = 'k';
ax1.GridColor = 'w';
ax1.GridAlpha = 0.3;
ax1.XColor = 'w';
ax1.YColor = 'w';

ax2 = subplot(2,1,2);
hold on;
for i = 1:length(configs)
    plot(results(i).F.Time, results(i).F.Data, 'LineWidth', 2, 'DisplayName', configs{i}.name, "Color", configs{i}.color);
end
legend('TextColor', 'w', 'Color', 'k', 'EdgeColor', ...
    [0.5 0.5 0.5], 'LineWidth', 1, 'FontSize', 10);
hold off;
grid on;
ylabel('Force (N)');
xlabel('Time (s)');
%title('Force');
ax2.Color = 'k';
ax2.GridColor = 'w';
ax2.GridAlpha = 0.3;
ax2.XColor = 'w';
ax2.YColor = 'w';