#include <bits/stdc++.h>
using namespace std;

const int N = 1e5 + 5;
vector<int> adj[N];
int color[N]; // -1 = unvisited, 0 and 1 = two colors

bool isBipartite(int n) {
    for(int i = 1; i <= n; i++) {
        if(color[i] == -1) {
            queue<int> q;
            q.push(i);
            color[i] = 0;

            while(!q.empty()) {
                int u = q.front();
                q.pop();

                for(int v : adj[u]) {
                    if(color[v] == -1) {
                        color[v] = 1 - color[u];
                        q.push(v);
                    }
                    else if(color[v] == color[u]) {
                        return false;
                    }
                }
            }
        }
    }
    return true;
}

int main() {
    int n, m;
    cin >> n >> m;

    for(int i = 1; i <= n; i++)
        color[i] = -1;

    while(m--) {
        int u, v;
        cin >> u >> v;
        adj[u].push_back(v);
        adj[v].push_back(u);
    }

    if(isBipartite(n)) cout << "Bipartite\n";
    else cout << "Not Bipartite\n";
}