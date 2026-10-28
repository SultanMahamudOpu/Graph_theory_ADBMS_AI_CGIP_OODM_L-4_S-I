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
bool vis[mx];
vector<int> adjList[mx];


void DFS(ll u)
{
    vis[u] = true;
    cout << u << " ";
 
    for (auto v : adjList[u])
    {
        if (vis[v] == false)
        {
            DFS(v);
        }
    }

    return;
}

void adjacencyList(ll n, ll m)
{
    for (int i = 0; i < m; i++)
    {
        ll u, v;
        cin >> u >> v;
        adjList[u].push_back(v);
        adjList[v].push_back(u);
    }
}

int main()
{
    optimize();

    ll n, m;
    cin >> n >> m;

    adjacencyList(n, m);
    ll src;
    cin >> src;

    DFS(src);
}

/*
Input:
6 7
1 2
1 3
2 4
2 5
3 6
4 6
5 6

Output:
1 2 4 6 3 5 
*/


