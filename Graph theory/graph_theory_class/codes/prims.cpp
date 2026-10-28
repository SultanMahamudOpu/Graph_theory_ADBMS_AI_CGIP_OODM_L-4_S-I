#include <bits/stdc++.h>
using namespace std;

const int N = 1e5 + 5;
vector<pair<int,int>> adj[N]; // {node, weight}
bool visited[N];

long long prim(int n) {
    priority_queue<pair<int,int>, vector<pair<int,int>>, greater<pair<int,int>>> pq;
    long long mst_cost = 0;

    pq.push({0, 1}); // start from node 1

    while(!pq.empty()) {
        auto x = pq.top();
        int w=x.first;
        int u=x.second;
        pq.pop();

        if(visited[u]) continue;
        visited[u] = true;
        mst_cost += w;

        for(auto y : adj[u]) {
            int v=y.first;
            int weight=y.second;
            if(!visited[v]) {
                pq.push({weight, v});
            }
        }
    }

    return mst_cost;
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

    cout << "MST Cost = " << prim(1) << "\n";
}