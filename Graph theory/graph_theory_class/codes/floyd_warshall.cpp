#include <bits/stdc++.h>
using namespace std;

const int INF = 1e9;

int main() {
    int n, m;
    cin >> n >> m;

    vector<vector<int>> dist(n+1, vector<int>(n+1, INF));

    for(int i = 1; i <= n; i++)
        dist[i][i] = 0;

    while(m--) {
        int u, v, w;
        cin >> u >> v >> w;
        dist[u][v] = w;
        //dist[v][u] = w; // remove if directed
    }

    for(int k = 1; k <= n; k++)
        for(int i = 1; i <= n; i++)
            for(int j = 1; j <= n; j++)
                if(dist[i][k] < INF && dist[k][j] < INF)
                    dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j]);

    for(int i = 1; i <= n; i++) {
        for(int j = 1; j <= n; j++) {
            if(dist[i][j] == INF) cout << "INF ";
            else cout << dist[i][j] << " ";
        }
        cout << "\n";
    }
}