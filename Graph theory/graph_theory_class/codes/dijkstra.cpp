#include <bits/stdc++.h>
using namespace std;

const int N = 1e5 + 5;
const long long INF = 1e18;

vector<pair<int,int>> adj[N]; // {node, weight}
long long dist[N];

void dijkstra(int source, int n) {
    for(int i = 1; i <= n; i++)
        dist[i] = INF;

    priority_queue<pair<long long,int>, vector<pair<long long,int>>, greater<pair<long long,int>>> pq;

    dist[source] = 0;
    pq.push({0, source});

    while(!pq.empty()) {
        auto x = pq.top();
        int d=x.first;
        int u=x.second;
        pq.pop();

        if(d > dist[u]) continue;

        for(auto y : adj[u]) {
            int v=y.first;
            int w=y.second;
            if(dist[u] + w < dist[v]) {
                dist[v] = dist[u] + w;
                pq.push({dist[v], v});
            }
        }
    }
}

int main() {
    int n, m;
    cin >> n >> m;

    while(m--) {
        int u, v, w;
        cin >> u >> v >> w;
        adj[u].push_back({v, w});
        adj[v].push_back({u, w}); 
    }

    int source;
    cin >> source;

    dijkstra(source, n);

    for(int i = 1; i <= n; i++)
        cout << "Distance to " << i << " = " << dist[i] << "\n";
}