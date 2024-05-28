def viterbi(N, A, B, initial_probs, observations):
    M = len(observations)
    dp = [[0.0] * N for _ in range(M)]
    path = [[0] * N for _ in range(M)]

    # 初始化第一天的概率
    for i in range(N):
        dp[0][i] = initial_probs[i] * A[i][observations[0] - 1]
        path[0][i] = 0

    # 动态规划填充dp表
    for t in range(1, M):
        for j in range(N):
            max_prob = -1.0
            max_state = 0
            for i in range(N):
                prob = dp[t - 1][i] * B[i][j] * A[j][observations[t] - 1]
                if prob > max_prob:
                    max_prob = prob
                    max_state = i
            dp[t][j] = max_prob
            path[t][j] = max_state

    # 回溯找到最可能的状态序列
    max_prob = -1.0
    last_state = 0
    for i in range(N):
        if dp[M - 1][i] > max_prob:
            max_prob = dp[M - 1][i]
            last_state = i

    best_path = [0] * M
    best_path[-1] = last_state
    for t in range(M - 2, -1, -1):
        best_path[t] = path[t + 1][best_path[t + 1]]

    # 输出结果，调整为1索引
    print(" ".join(str(state + 1) for state in best_path))

while True:
    N = int(input())
    if N == 0:
        break

    A = [list(map(float, input().split())) for _ in range(N)]
    B = [list(map(float, input().split())) for _ in range(N)]
    initial_probs = list(map(float, input().split()))

    M = int(input())
    observations = list(map(int, input().split()))

    viterbi(N, A, B, initial_probs, observations)
