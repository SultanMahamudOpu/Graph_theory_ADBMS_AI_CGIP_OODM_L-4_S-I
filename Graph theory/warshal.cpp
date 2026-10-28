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
ll dist[mx][mx];

void floydWarshall(ll n)
{
    for (ll k = 1; k <= n; k++)
    {
        for (ll i = 1; i <= n; i++)
        {
            for (ll j = 1; j <= n; j++)
            {
                if (dist[i][k] != inf && dist[k][j] != inf)
                {
                    dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j]);
                }
            }
        }
    }
}

int main()
{
    optimize();

    ll n, m;
    cin >> n >> m;

    for (ll i = 1; i <= n; i++)
    {
        for (ll j = 1; j <= n; j++)
        {
            if (i == j)
                dist[i][j] = 0;
            else
                dist[i][j] = inf;
        }
    }

    for (ll i = 0; i < m; i++)
    {
        ll u, v, w;
        cin >> u >> v >> w;
        dist[u][v] = w;
        dist[v][u] = w; 
    }

    floydWarshall(n);

    
    for (ll i = 1; i <= n; i++)
    {
        for (ll j = 1; j <= n; j++)
        {
            if (dist[i][j] == inf)
                cout << "INF";
            else
                cout << dist[i][j];

            if (j < n) cout << " ";
        }
        cout << endl;
    }

    return 0;
}


/*
Input:
4 5
1 2 3
1 3 8
2 3 2
2 4 5
3 4 1
Output:
0 3 5 6                                                                                                                                                                                    
3 0 2 3
5 2 0 1
6 3 1 0
*/ 