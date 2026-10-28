//* Bismillahir Rahmanir Rahim *\

#include <bits/stdc++.h>
using namespace std;

#define optimize()                \
    ios_base::sync_with_stdio(0); \
    cin.tie(0);                   \
    cout.tie(0);
#define fraction()                \
    cout.unsetf(ios::floatfield); \
    cout.precision(10);           \
    cout.setf(ios::fixed, ios::floatfield);
#define mem(arr, k) memset(arr, k, sizeof(arr))
#define MOD 1000000007
#define sqr(a) ((a) * (a))
#define endl "\n"
typedef long long ll;
typedef double dd;
const double PI = acos(-1);
const double eps = 1e-9;
const int inf = 2000000000;
const ll infLL = 9000000000000000000;
const int N = 2e5 + 123;
ll prfSum[N];

ll gcd(ll a, ll b) { return __gcd(a, b); }
ll lcm(ll a, ll b) { return a * (b / gcd(a, b)); }

const ll mx = 112;
ll dist[mx];
vector<pair<ll, ll>> adjList[mx]; // {weight, node}

void dijkstra(ll src)
{
    for (ll i = 0; i < mx; i++) dist[i] = infLL;

    // min-heap: {distance, node}
    priority_queue<pair<ll, ll>, vector<pair<ll, ll>>, greater<pair<ll, ll>>> pq;
    pq.push({0, src});
    dist[src] = 0;

    while (!pq.empty())
    {
        ll d = pq.top().first;
        ll u = pq.top().second;
        pq.pop();

        if (d > dist[u]) continue; // outdated entry, skip

        for (auto edge : adjList[u])
        {
            ll w = edge.first;
            ll v = edge.second;

            if (dist[u] + w < dist[v])
            {
                dist[v] = dist[u] + w;
                pq.push({dist[v], v});
            }
        }
    }
}

void adjacencyList(ll n, ll m)
{
    for (int i = 0; i < m; i++)
    {
        ll u, v, w;
        cin >> u >> v >> w;
        adjList[u].push_back({w, v});
        adjList[v].push_back({w, u}); // remove for directed graph
    }
}

int main()
{
    optimize();

    ll n, m, src;
    cin >> n >> m;

    adjacencyList(n, m);

    cin>>src;
    dijkstra(src);

    // Print shortest distance from src to all nodes
    for (ll i = 1; i <= n; i++)
    {
        cout << "dist[" << src << "][" << i << "] = ";
        if (dist[i] == infLL)
            cout << "INF" << endl;
        else
            cout << dist[i] << endl;
    }

    return 0;
}


/*
Input:
5 6 
1 2 4
1 3 2
2 3 1
2 4 5
3 4 8
4 5 2
1
Output:
dist[1][1] = 0
dist[1][2] = 3
dist[1][3] = 2
dist[1][4] = 8
dist[1][5] = 10
*/