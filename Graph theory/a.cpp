//* Bismillahir Rahmanir Rahim *//

#include <bits/stdc++.h>
using namespace std;

#define INF 1e9

int main()
{
    int n, m;
    cin >> n >> m;  // number of vertices and edges

    vector<vector<int>> dist(n+1, vector<int>(n+1, INF));

    // Distance to itself = 0
    for(int i = 1; i <= n; i++)
        dist[i][i] = 0;

    // Input edges
    for(int i = 0; i < m; i++)
    {
        int u, v, w;
        cin >> u >> v >> w;
        dist[u][v] = w;   // directed graph
        // যদি undirected হয় তাহলে নিচের লাইন ব্যবহার করো
        // dist[v][u] = w;
    }

    // Floyd-Warshall Algorithm
    for(int k = 1; k <= n; k++)
    {
        for(int i = 1; i <= n; i++)
        {
            for(int j = 1; j <= n; j++)
            {
                if(dist[i][k] + dist[k][j] < dist[i][j])
                {
                    dist[i][j] = dist[i][k] + dist[k][j];
                }
            }
        }
    }

    // Output shortest distance matrix
    cout << "Shortest Distance Matrix:\n";
    for(int i = 1; i <= n; i++)
    {
        for(int j = 1; j <= n; j++)
        {
            if(dist[i][j] == INF)
                cout << "INF ";
            else
                cout << dist[i][j] << " ";
        }
        cout << endl;
    }

    return 0;
}