import matplotlib.pyplot as plt

# 提供的数据
data = [(0, 'x'), (1600000, '0'), (40000800000, '1'), (40001600000, '0'), (80000800000, '1'), (80001600000, '0'), (120000800000, '1'), (120001600000, '0'), (160000800000, '1'), (160001600000, '0'), (200000800000, '1'), (200001600000, '0'), (240000800000, '1'), (240001600000, '0'), (280000800000, '1')]

# 提取时间点和状态，并将 'x' 替换为 -1
time_points = [t for t, _ in data]
statuses = [-1 if status == 'x' else int(status) for _, status in data]

# 绘制高低电平图
plt.figure(figsize=(10, 4))
plt.step(time_points, statuses, where='post', color='blue')
plt.xlabel('Time (ps)')
plt.ylabel('High/Low')
plt.title('High/Low Level over Time')
plt.grid(True)
plt.show()


